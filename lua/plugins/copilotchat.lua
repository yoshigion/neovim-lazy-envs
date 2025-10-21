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
      width = 0.5,
    },
  },
}
