#!/usr/bin/env python3
"""Wi-Fi picker for the waybar network module.

Lists nearby networks in rofi (using networkmenu.rasi), lets you pick one,
and connects via nmcli. Asks for a password (through rofi) only when the
network needs one and no saved profile already has it.
"""
import re
import subprocess
import sys

THEME = "/home/pablolinari/.config/rofi/networkmenu.rasi"

ICON_LOCK = "\U000f033e"
ICON_STRENGTH = [
    "\U000f091f",  # 1 bar
    "\U000f0922",  # 2 bars
    "\U000f0925",  # 3 bars
    "\U000f0928",  # 4 bars
]
ICON_CHECK = "\U000f05e0"
ICON_REFRESH = "\U000f0450"
ICON_DISCONNECT = "\U000f05aa"

RESCAN_LABEL = f"{ICON_REFRESH}  Rescan"
DISCONNECT_LABEL = f"{ICON_DISCONNECT}  Disconnect"


def run(cmd, **kw):
    return subprocess.run(cmd, capture_output=True, text=True, **kw)


def notify(title, body="", urgency="normal"):
    run(["notify-send", "-a", "Network", "-u", urgency, title, body])


def rofi_select(lines, prompt, password=False):
    cmd = ["rofi", "-dmenu", "-theme", THEME, "-p", prompt, "-i"]
    if password:
        cmd.append("-password")
    result = subprocess.run(
        cmd, input="\n".join(lines), capture_output=True, text=True
    )
    if result.returncode != 0:
        return None
    return result.stdout.strip()


def wifi_device():
    out = run(["nmcli", "-t", "-f", "DEVICE,TYPE", "device", "status"]).stdout
    for line in out.splitlines():
        dev, _, dtype = line.partition(":")
        if dtype == "wifi":
            return dev
    return None


def split_terse(line):
    # nmcli -t escapes literal ':' inside a field as '\:'
    parts = re.split(r"(?<!\\):", line)
    return [p.replace("\\:", ":") for p in parts]


def scan():
    out = run(
        [
            "nmcli",
            "-t",
            "-f",
            "SSID,SIGNAL,SECURITY,IN-USE",
            "device",
            "wifi",
            "list",
            "--rescan",
            "yes",
        ]
    ).stdout
    best = {}
    for line in out.splitlines():
        if not line.strip():
            continue
        ssid, signal, security, in_use = split_terse(line)
        if not ssid:
            continue
        try:
            signal = int(signal)
        except ValueError:
            signal = 0
        entry = best.get(ssid)
        if entry is None or signal > entry["signal"]:
            best[ssid] = {
                "signal": signal,
                "secured": bool(security.strip()),
                "active": in_use.strip() == "*",
            }
    return best


def strength_icon(signal):
    idx = min(3, signal // 25)
    return ICON_STRENGTH[idx]


def main():
    networks = scan()
    if not networks:
        notify("Wi-Fi", "No se encontraron redes cercanas", "critical")
        return

    ordered = sorted(networks.items(), key=lambda kv: kv[1]["signal"], reverse=True)

    display_to_ssid = {}
    lines = [RESCAN_LABEL]
    active_ssid = None
    for ssid, info in ordered:
        if info["active"]:
            active_ssid = ssid
        label = f"{strength_icon(info['signal'])}  "
        if info["secured"]:
            label += f"{ICON_LOCK} "
        label += ssid
        if info["active"]:
            label += f"  {ICON_CHECK}"
        display_to_ssid[label] = ssid
        lines.append(label)

    if active_ssid:
        lines.insert(1, DISCONNECT_LABEL)

    choice = rofi_select(lines, "Wi-Fi")
    if not choice:
        return

    if choice == RESCAN_LABEL:
        main()
        return

    if choice == DISCONNECT_LABEL:
        dev = wifi_device()
        if dev:
            run(["nmcli", "device", "disconnect", dev])
            notify("Wi-Fi", "Desconectado")
        return

    ssid = display_to_ssid.get(choice)
    if not ssid:
        return

    info = networks[ssid]

    if info["active"]:
        notify("Wi-Fi", f"Ya conectado a {ssid}")
        return

    # Try a saved profile first (nmcli names auto-created profiles after the SSID).
    up = run(["nmcli", "connection", "up", "id", ssid])
    if up.returncode == 0:
        notify("Wi-Fi", f"Conectado a {ssid}")
        return

    if not info["secured"]:
        connect = run(["nmcli", "device", "wifi", "connect", ssid])
        if connect.returncode == 0:
            notify("Wi-Fi", f"Conectado a {ssid}")
        else:
            notify("Wi-Fi", f"No se pudo conectar a {ssid}", connect.stderr.strip(), "critical")
        return

    password = rofi_select([], f"Contraseña de {ssid}", password=True)
    if not password:
        return

    connect = run(["nmcli", "device", "wifi", "connect", ssid, "password", password])
    if connect.returncode == 0:
        notify("Wi-Fi", f"Conectado a {ssid}")
    else:
        notify("Wi-Fi", f"No se pudo conectar a {ssid}", connect.stderr.strip(), "critical")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:  # keep failures visible instead of silently dying
        notify("Wi-Fi", "Error en el script", str(exc), "critical")
        sys.exit(1)
