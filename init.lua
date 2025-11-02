-- init.lua
-- Neovim のエントリーポイント
require("configs-setup")  -- 基本設定（options, keymaps, autocmds）
require("plugins-setup")  -- プラグイン管理

-- OR setup with some options
require("nvim-tree").setup({
  sort = { sorter = "case_sensitive", },
  view = { width = 30, },
  renderer = { group_empty = true, },
  filters = { dotfiles = true, },
})
vim.cmd([[highlight NvimTreeNormal guibg=NONE]]) -- 背景色を透明化
vim.cmd([[highlight NvimTreeVertSplit guibg=NONE]]) -- 分割ラインの調整

---- copilotchat with jp prompts
--require('copilotchat-configjp')
