-- lua/plugins/copilot.lua
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = false
      },
      panel = {
        enabled = false
      },
      copilot_node_command = vim.fn.exepath("node"), -- PATH上の node を動的に解決（nvmのバージョン切替に追従）
      filetypes = {
        ["*"] = true,
        -- copilotchat = true,
      },
    })
  end,
}
