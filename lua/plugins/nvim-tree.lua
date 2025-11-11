-- lua/plugins/nvim-tree.lua
-- tree file list
local function my_nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', '<C-e>', api.tree.close,                        opts('Close'))
end

-- setup body
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
      on_attach = my_nvim_tree_on_attach,
    })
    vim.cmd([[highlight NvimTreeNormal guibg=NONE]]) -- 背景色を透明化
    vim.cmd([[highlight NvimTreeVertSplit guibg=NONE]]) -- 分割ラインの調整
  end,
}
