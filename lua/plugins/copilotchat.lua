-- ~/.config/nvim/lua/plugins/copilotchat.lua
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- すでに導入済みなら不要
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("CopilotChat").setup({
      mappings = {
        submit_prompt = "<CR>",
        close = "<Esc>",
      },
      window = {
        layout = "vertical", -- "float", "vertical", "horizontal" が選択可能
        relative = "editor",
        width = 0.5,
        height = 1.0,
      },
      filetypes = {
        copilotchat = true,
      },
    })
  end,
  cmd = "CopilotChat",
}
