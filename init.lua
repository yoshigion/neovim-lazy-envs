-- lazy.nvim のセットアップ
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

require("lazy").setup({
  -- プラグインリストをここに追加
  -- tree file list
  { "nvim-tree/nvim-tree.lua" },

  -- status line
  { "nvim-lualine/lualine.nvim" },
    dependencies = { 'nvim-tree/nvim-web-devicons' },

  -- onedark color scheme
  { "navarasu/onedark.nvim" },

  -- tree sitter
  { "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },

  -- import lua/plugins/*.lua
  { import = "plugins" },

})


-- disable mouse
vim.opt.mouse=""

-- specify python under pyenv
vim.g.python3_host_prog = '~/.pyenv/versions/3.12.11/bin/python'
-- specify ruby under rbenv
vim.g.ruby_host_prog = '~/.rbenv/versions/3.4.7/bin/ruby'
-- disable perl provider
vim.g.loaded_perl_provider = 0

-- disable hererocks
--vim.opts.rocks.hererocks = false
-- suppress checkhealth luarocks error/warning
-- opts.rocks.hererocks = false
-- opts.rocks.enabled = false

---- onedark.lua
require('onedark').setup {
    style = 'dark' -- または 'dark', 'darker', 'cool', 'warm' などお好みで
}
require('onedark').load()

---- nvim-tree.lua
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort = { sorter = "case_sensitive", },
  view = { width = 30, },
  renderer = { group_empty = true, },
  filters = { dotfiles = true, },
})
vim.cmd([[highlight NvimTreeNormal guibg=NONE]]) -- 背景色を透明化
vim.cmd([[highlight NvimTreeVertSplit guibg=NONE]]) -- 分割ラインの調整
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

---- lualine.nvim
require('lualine').setup({
  options = { theme = 'onedark', },
})

---- copilotchat.lua: avoid conflict <Tab>
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

---- copilotchat with jp prompts
--require('copilotchat-configjp')

---- nvim-treesitter
--  require'nvim-treesitter.configs'.setup({
--    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
--    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
--  
--    -- Install parsers synchronously (only applied to `ensure_installed`)
--    sync_install = false,
--  
--    -- Automatically install missing parsers when entering buffer
--    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--    auto_install = true,
--  
--    -- List of parsers to ignore installing (or "all")
--    ignore_install = { "javascript" },
--  
--    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
--    -- parser_install_dir = "/some/path/to/store/parsers",
--    -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
--  
--    highlight = {
--      enable = true,
--  
--      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
--      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
--      -- the name of the parser)
--      -- list of language that will be disabled
--      disable = { "c", "rust" },
--      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
--      disable = function(lang, buf)
--          local max_filesize = 100 * 1024 -- 100 KB
--          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--          if ok and stats and stats.size > max_filesize then
--              return true
--          end
--      end,
--  
--      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--      -- Using this option may slow down your editor, and you may see some duplicate highlights.
--      -- Instead of true it can also be a list of languages
--      additional_vim_regex_highlighting = false,
--    },
--  })
