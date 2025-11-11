-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason UI & LSP連携の初期化
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        --"pyright",
        --"tsserver",
        --"bashls",
        --"marksman", -- Markdown
      },
      automatic_installation = true,
    })

    -- LSPサーバーの有効化（Neovim 0.11+）
    -- 例: Lua 言語サーバー
    -- Lua 言語サーバーを有効化
    vim.lsp.enable("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- Python（pyright）など他の LSP も同様に
    --vim.lsp.enable("pyright", {})
  end,
}
