-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = "/home/obayashi/.config/nvm/versions/node/v22.20.0/bin/node", -- Node.jsのパス
      filetypes = { ["*"] = true },
    })
  end,
}
