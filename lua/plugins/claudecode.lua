-- ~/.config/nvim/lua/plugins/claudocode.lua
--   https://github.com/coder/claudecode.nvim
local claude_cmd = vim.fn.exepath("claude") -- PATH上の claude を動的に解決（バージョン更新に追従）
return {
  "coder/claudecode.nvim",
  dependencies = {
    { "folke/snacks.nvim" },
  },
  opts = {
    terminal_cmd = claude_cmd ~= "" and claude_cmd or "claude",
  },
  config = true,
  keys = { {"<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code", }, },
}
