#!/usr/bin/env python3
"""Bluetooth picker for the waybar bluetooth module.

Lists known/nearby devices in rofi (using networkmenu.rasi), lets you pick
one, and pairs/connects (or disconnects) via bluetoothctl.
"""
import re
import subprocess
import sys

THEME = "/home/pablolinari/.config/rofi/networkmenu.rasi"

ICON_BT = "\U000f00af"
ICON_BT_CONNECTED = "\U000f00b1"
ICON_CHECK = "\U000f05e0"
ICON_REFRESH = "\U000f0450"
ICON_POWER_OFF = "\U000f0902"

RESCAN_LABEL = f"{ICON_REFRESH}  Rescan"
POWER_OFF_LABEL = f"{ICON_POWER_OFF}  Power off Bluetooth"

MAC_RE = re.compile(r"^Device ([0-9A-F:]{17}) (.+)$")


def run(cmd, timeout=None):
    return subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)


def notify(title, body="", urgency="normal"):
    run(["notify-send", "-a", "Bluetooth", "-u", urgency, title, body])


def rofi_select(lines, prompt):
    result = subprocess.run(
        ["rofi", "-dmenu", "-theme", THEME, "-p", prompt, "-i"],
        input="\n".join(lines),
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        return None
    return result.stdout.strip()


def is_powered():
    out = run(["bluetoothctl", "show"]).stdout
    return "Powered: yes" in out


def ensure_powered():
    if is_powered():
        return True
    run(["rfkill", "unblock", "bluetooth"])
    run(["bluetoothctl", "power", "on"], timeout=10)
    return is_powered()


def device_set(filt=None):
    cmd = ["bluetoothctl", "devices"]
    if filt:
        cmd.append(filt)
    out = run(cmd).stdout
    macs = set()
    for line in out.splitlines():
        m = MAC_RE.match(line.strip())
        if m:
            macs.add(m.group(1))
    return macs


def scan_devices():
    run(["bluetoothctl", "--timeout", "5", "scan", "on"], timeout=10)
    out = run(["bluetoothctl", "devices"]).stdout
    devices = {}
    for line in out.splitlines():
        m = MAC_RE.match(line.strip())
        if m:
            devices[m.group(1)] = m.group(2)
    return devices


def main():
    if not ensure_powered():
        notify("Bluetooth", "No se pudo encender el adaptador", "critical")
        return

    devices = scan_devices()
    if not devices:
        notify("Bluetooth", "No se encontraron dispositivos cercanos", "critical")
        return

    connected = device_set("Connected")

    display_to_mac = {}
    lines = [RESCAN_LABEL, POWER_OFF_LABEL]
    for mac, name in sorted(devices.items(), key=lambda kv: kv[1].lower()):
        is_conn = mac in connected
        icon = ICON_BT_CONNECTED if is_conn else ICON_BT
        label = f"{icon}  {name}"
        if is_conn:
            label += f"  {ICON_CHECK}"
        display_to_mac[label] = mac
        lines.append(label)

    choice = rofi_select(lines, "Bluetooth")
    if not choice:
        return

    if choice == RESCAN_LABEL:
        main()
        return

    if choice == POWER_OFF_LABEL:
        run(["bluetoothctl", "power", "off"], timeout=10)
        notify("Bluetooth", "Adaptador apagado")
        return

    mac = display_to_mac.get(choice)
    if not mac:
        return

    name = devices[mac]

    if mac in connected:
        result = run(["bluetoothctl", "disconnect", mac], timeout=10)
        if "Successful" in result.stdout or "Successful" in result.stderr:
            notify("Bluetooth", f"Desconectado de {name}")
        else:
            notify("Bluetooth", f"No se pudo desconectar {name}", result.stdout.strip(), "critical")
        return

    paired = mac in device_set("Paired")
    if not paired:
        pair = run(["bluetoothctl", "--timeout", "15", "pair", mac], timeout=20)
        if "Failed" in pair.stdout or "Error" in pair.stdout:
            notify("Bluetooth", f"No se pudo emparejar con {name}", pair.stdout.strip(), "critical")
            return
        run(["bluetoothctl", "trust", mac], timeout=10)

    connect = run(["bluetoothctl", "--timeout", "10", "connect", mac], timeout=15)
    if "Failed" in connect.stdout or "not available" in connect.stdout:
        notify("Bluetooth", f"No se pudo conectar a {name}", connect.stdout.strip(), "critical")
    else:
        notify("Bluetooth", f"Conectado a {name}")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        notify("Bluetooth", "Error en el script", str(exc), "critical")
        sys.exit(1)
