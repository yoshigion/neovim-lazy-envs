-- lua/plugins/nvim-treesitter.lua
-- tree sitter highlighting settings
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
        "javascript",
        "html",
        "css",
        "json",
        "bash",
        "yaml",
        "make",
        "awk",
      },
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
    })
  end,
}
