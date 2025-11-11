-- lua/plugins-setup.lua
-- Lazy.nvimのブートストラップ（自動インストール）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインのセットアップ
require("lazy").setup({

  -- lua/plugins/*.lua を自動的にインポート
  { import = "plugins" },

}, {
  -- Lazy.nvim自体の設定
  defaults = {
    lazy = false, -- デフォルトでは遅延読み込みしない
    version = nil, -- 常に最新版を使用
  },
  checker = {
    enabled = true, -- 起動時に更新をチェック
    notify = false, -- 通知を無効化
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
