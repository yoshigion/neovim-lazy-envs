-- lua/config/options.lua
-- disable mouse
vim.opt.mouse = "" -- disable mouse

-- specify python under pyenv
vim.g.python3_host_prog = "~/.pyenv/versions/3.14.2/bin/python"
-- specify ruby under rbenv
vim.g.ruby_host_prog = "~/.rbenv/versions/3.4.7/bin/ruby"
-- disable perl provider
vim.g.loaded_perl_provider = 0

-- disable hererocks
--vim.opts.rocks.hererocks = false
-- suppress checkhealth luarocks error/warning
-- opts.rocks.hererocks = false
-- opts.rocks.enabled = false

---- nvim-tree.lua
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

---- copilotchat.lua: avoid conflict <Tab>
vim.g.copilot_no_tab_map = true

---- <leader>キーをバックスラッシュからスペースに変更する
vim.g.mapleader = "\\"

---- clipboard sharing between wsl2 and windows
vim.opt.clipboard = "unnamedplus"
--vim.opt.clipboard = "unnamed"
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

---- rustaceanvim.lua
--vim.g.rustaceanvim = {
--  server = {
--    on_attach = function(client, bufnr)
--      vim.keymap.set('n', '<leader>a', function()
--        vim.cmd.RustLsp('codeAction') -- rust-analyzerのグルーピング対応
--      end, { silent = true, buffer = bufnr })
--      vim.keymap.set('n', 'K', function()
--        vim.cmd.RustLsp({ 'hover', 'actions' })
--      end, { silent = true, buffer = bufnr })
--    end,
--    default_settings = {
--      ['rust-analyzer'] = {
--        cargo = { allFeatures = true },
--        checkOnSave = true,
--        check = { command = 'clippy' }, -- 保存時にclippyを回したい場合
--      },
--    },
--  },
--}
