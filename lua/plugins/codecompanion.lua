-- lua/plugins/codecompanion.lua
return {
  "olimorris/codecompanion.nvim",
  -- version = "v18.0.0",  -- v19に更新 (mcphub連携は一時無効化)
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {},
  config = function()
    require("codecompanion").setup({
      adapters = {
        http = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "ANTHROPIC_API_KEY",
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = "anthropic",
          model = "claude-sonnet-4-20250514",
        },
        inline = {
          adapter = "anthropic",
        },
      },
      -- mcphub連携は無効化
      -- extensions = { ... }
    })
  end,
}
