-- lua/plugins/none-ls.lua
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatting
        null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),
        null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh" } }),
        null_ls.builtins.formatting.prettierd.with({ filetypes = { "javascript", "typescript", "json", "markdown" } }),
        null_ls.builtins.formatting.black.with({ filetypes = { "python" } }),

        -- Diagnostics(Linter)
        null_ls.builtins.diagnostics.selene.with({ filetypes = { "lua", "luau" } }),
        null_ls.builtins.diagnostics.dotenv_linter.with({ filetypes = { "sh" } }),
        null_ls.builtins.diagnostics.vale.with({ filetypes = { "markdown", "tex", "asciidoc" } }),
      },
    })
  end,
}
