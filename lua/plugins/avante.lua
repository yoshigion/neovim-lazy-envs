-- lua/plugins/avante.lua
-- MCP Chat Client for Neovim
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- for example
  },
  config = function()
    require("avante").setup({
      -- system_prompt as function ensures LLM always has latest MCP server state
      -- https://ravitemer.github.io/mcphub.nvim/extensions/avante.html#add-tools-to-avante
      -- This is evaluated for every message, even in existing chats
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      -- Using function prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
    })
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    { "ravitemer/mcphub.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
    { "stevearc/dressing.nvim" }, -- for input provider dressing
    { "nvim-lua/plenary.nvim" },
    { "MunifTanjim/nui.nvim" },
    --- The below dependencies are optional,
    { "nvim-mini/mini.pick" }, -- for file_selector provider mini.pick
    { "nvim-telescope/telescope.nvim" }, -- for file_selector provider telescope
    { "hrsh7th/nvim-cmp" }, -- autocompletion for avante commands and mentions
    { "ibhagwan/fzf-lua" }, -- for file_selector provider fzf
    -- { "folke/snacks.nvim" }, -- for input provider snacks
    { "nvim-tree/nvim-web-devicons" }, -- or echasnovski/mini.icons
    { "zbirenbaum/copilot.lua" }, -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
