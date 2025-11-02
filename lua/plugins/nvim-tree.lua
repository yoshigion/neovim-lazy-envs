-- lua/plugins/nvim-tree.lua
-- tree file list
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- OR setup with some options
  config = function()
    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive", },
      view = { width = 30, },
      renderer = { group_empty = true, },
      filters = { dotfiles = true, },
    })
    vim.cmd([[highlight NvimTreeNormal guibg=NONE]]) -- 背景色を透明化
    vim.cmd([[highlight NvimTreeVertSplit guibg=NONE]]) -- 分割ラインの調整
  end,
}
