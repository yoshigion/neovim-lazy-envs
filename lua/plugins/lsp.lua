-- lua/plugins/lsp.lua
-- Mason + 分割読み込み
return {
  "williamboman/mason.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        --"pyright",  -- Python
        --"tsserver", -- TypeScript/JavaScript
        --"bashls",   -- Bash
        --"marksman", -- Markdown
      },
      automatic_installation = true,
    })

    -- lsp/*.lua (Neovim 0.11+ ネイティブ形式) を読み込んで有効化
    vim.lsp.enable({ "lua_ls", "efm" })
    --vim.lsp.enable("pyright")
    --vim.lsp.enable("tsserver")
    --vim.lsp.enable("bashls")
    --vim.lsp.enable("marksman")
  end,
}
