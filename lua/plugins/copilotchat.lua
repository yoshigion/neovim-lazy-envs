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
      layout = "float", -- "float", "vertical", "horizontal" が選択可能
      width = 0.5,
      height = 0.5,
    },
  },
  config = function()
    require("CopilotChat").setup({
      mappings = {
        submit_prompt = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
      },
    })
  end,
}
