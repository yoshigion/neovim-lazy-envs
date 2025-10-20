-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        ["*"] = true,
        copilotchat = true, -- ← これが必要
        help = false,
        gitcommit = true,
        markdown = true,
      },
      copilot_node_command = "/home/obayashi/.config/nvm/versions/node/v22.20.0/bin/node", -- Node.jsのパス
    })
  end,
}
