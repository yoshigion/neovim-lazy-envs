-- ~/.config/nvim/lua/plugins/copilotchat.lua
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- すでに導入済みなら不要
    { "nvim-lua/plenary.nvim" },
  },
  build = "make tiktoken",
  opts = {
    window = {
      layout = "vertical", -- "float", "vertical", "horizontal" が選択可能
      relative = "editor",
      width = 0.6,
      height = 0.6,
    },
    mappings = {
      close = "<Esc>",
      submit_prompt = "<CR>",
    },
  },
  cmd = "CopilotChat",
}
