-- lua/plugins/img-clip.lua
return {
  "yoshigion/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
  default = {
    prompt_for_file_name = false,
    dir_path = "contents/assets",
    file_name = function()
      local current_buf_name_without_ext = vim.fn.expand("%:t:r")
      return current_buf_name_without_ext .. "-%Y%m%d%H%M%S"
    end,
  },
  config = function()
    require("img-clip").setup({
      dir_path = "contents/assets",
      relateive_to_current_file = true,
    })
  end,
}
