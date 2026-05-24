-- lua/plugins/minuet.lua
return {
  "milanglacier/minuet-ai.nvim",
  config = function()
    require("minuet").setup({
      provider = "claude",
      provider_options = {
        claude = {
          model = "claude-sonnet-4-20250514",
          system = require("minuet.config").default_system,
          few_shots = require("minuet.config").default_few_shots,
          stream = true,
          optional = {},
        },
      },
    })
  end,
}
