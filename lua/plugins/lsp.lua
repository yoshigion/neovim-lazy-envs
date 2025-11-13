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

    -- 各LSPの設定を読み込む
    require("lsp.lua_ls")
    --require("lsp.pyright")
    --require("lsp.tsserver")
    --require("lsp.bashls")
    --require("lsp.marksman")
  end,
}
