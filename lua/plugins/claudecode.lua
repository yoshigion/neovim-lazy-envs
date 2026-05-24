-- ~/.config/nvim/lua/plugins/claudocode.lua
--   https://github.com/coder/claudecode.nvim
return {
  "coder/claudecode.nvim",
  dependencies = {
    { "folke/snacks.nvim" },
  },
  opts = {
    terminal_cmd = "/home/obayashi/.local/share/claude/versions/2.1.150",
  },
  config = true,
  keys = { {"<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code", }, },
}
