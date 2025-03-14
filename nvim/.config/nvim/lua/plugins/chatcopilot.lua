local prompts = {
  Explain = "Porfavor eplicame esto", -- Prompt to explain code
  Review = "Porfavor revisa el codigo y dime sugerencias de mejora", -- Prompt to review code
  Refactor = "Porfavor refactoriza el codigo para mejorar la legibilidad y la lectura del mismo , pero no cambies el codigo en si ", -- Prompt to refactor code
  FixCode = "Porfavor arregla el codigo para que funcione como debe de funcionar.", -- Prompt to fix code
  FixError = "Porfavor arregla el error que esta ocurriendo para que el codigo funcione", -- Prompt to fix errors
  BetterNamings = "Please provide better names for the following variables and functions in english.", -- Prompt to suggest better names
  Documentation = "Please provide documentation for the following code in english.", -- Prompt to generate documentation
  JsDocs = "Please provide JsDocs for the following code.", -- Prompt to generate JsDocs
  Summarize = "Please summarize the following text.", -- Prompt to summarize text
  Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
  Wording = "Please improve the grammar and wording of the following text.", -- Prompt to improve wording
  Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
}


return{
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
			prompts = prompts,
			system_prompt = "Soy un ingeniero informatico y matematico , con una experiencia media , quiero que me expliques las cosas con detalles y con ejemplos faciles de entender pero que sean tecnicos  . Habla con un tono profesional pero cercano y con un toque de humor inteligente , evita la formalidad excesiva y usa frases com 'Leña al mono que es de goma' ,  o 'si fuese facil se llamaria magisterio ' . Mis principales intereses son la inteligencia artificial y el machine learning y de lenguajes manejo c++ , python y javascript",

			model ="gpt-4o",
			answer_header ="Aqui tienes mi Señor :",
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
