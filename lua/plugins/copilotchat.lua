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
    mappings = {
      submit_prompt = {
        normal = '<C-y>',
        insert = '<C-y>',
      },
    },
  },
  config = function(_, opts)
    local ok, copilotchat = pcall(require, "CopilotChat")
    if ok then
      copilotchat.setup(opts)
    else
      vim.notify("CopilotChat.nvim not found!", vim.log.levels.ERROR)
    end
  end,
}
