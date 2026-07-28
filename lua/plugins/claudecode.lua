-- ~/.config/nvim/lua/plugins/claudocode.lua
--   https://github.com/coder/claudecode.nvim
return {
  "coder/claudecode.nvim",
  dependencies = {
    { "folke/snacks.nvim" },
  },
  opts = {
    terminal_cmd = vim.fn.exepath("claude") ~= "" and vim.fn.exepath("claude") or "claude", -- PATH上の claude を動的に解決（バージョン更新に追従）
  },
  config = true,
  keys = { {"<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code", }, },
}
