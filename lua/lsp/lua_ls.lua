-- lua/lsp/lua_ls.lua
-- Lua 言語サーバーを有効化（Neovim 0.11+）
vim.lsp.enable("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
