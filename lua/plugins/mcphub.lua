-- lua/plugins/mcphub.lua
-- MCP Client for Neovim
return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  build = "npm install -g mcp-hub@latest",
  config =function()
    require("mcphub").setup({
      extensions = {
        -- https://ravitemer.github.io/mcphub.nvim/extensions/avante.html#configure-avante-integration
        avante = {
          make_slash_commands = true, -- make /slash commands from MCP server prompts
        },
        --copilotchat = {
        --  enabled = true,
        --  convert_tools_to_functions = true,
        --  convert_resources_to_functions = true,
        --  add_mcp_prefix = false,
        --}
      },
      -- https://ravitemer.github.io/mcphub.nvim/extensions/avante.html#global-auto-approval
      -- This sets vim.g.mcphub_auto_approve to true by default (can also be toggled from the HUB UI with `ga`)
      auto_approve = true,
    })
  end
}
