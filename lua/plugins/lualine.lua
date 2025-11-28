-- lua/plugins/lualine.lua
-- status line
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      -- https://ravitemer.github.io/mcphub.nvim/extensions/lualine.html#lualine-integration
      -- above description is incorrect, so not introduced
      options = {
        theme = "onedark",
        globalstatus = true,
      },
    })
  end,
}
