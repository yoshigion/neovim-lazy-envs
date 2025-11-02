-- lua/plugins/onedark.lua
-- -- onedark.nvim の設定
-- Using Lazy
return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'dark' -- または 'dark', 'darker', 'cool', 'warm' などお好みで
    }
    -- Enable theme
    require('onedark').load()
  end,
}
