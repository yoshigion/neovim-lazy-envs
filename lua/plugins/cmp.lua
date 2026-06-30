-- lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- LSP
    { "hrsh7th/cmp-nvim-lsp" },
    -- Buffer/Vim-builtin functionality
    { "hrsh7th/cmp-buffer" },  -- buffer
    -- Filesystem paths
    { "hrsh7th/cmp-path" },
    -- Command line
    { "hrsh7th/cmp-cmdline" },
    -- Snippets
    { "L3MON4D3/LuaSnip" },  -- luasnip
    -- For luasnip users.
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { "milanglacier/minuet-ai.nvim" },
    { "nvim-lua/plenary.nvim" },
    -- copilot-cmp
    { "zbirenbaum/copilot-cmp" },  -- ← 追加
    { "zbirenbaum/copilot.lua" },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-j>"] = require("minuet").make_cmp_map(),  -- 手動でClaude補完を呼ぶ
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "minuet" }, -- ← claude を minuet-ai 経由で使う場合
        { name = "llm" }, -- ← gpt を llm.nvim 経由で使う場合
        { name = "buffer" },
        { name = "path" },
        { name = "copilot" }, -- ← copilot-cmp を使う場合
      }),
    })
  end,
}
