-- lua/plugins/asciidoc-preview.lua
-- Asciidoc Preview Plugin Configuration
return {
  "tigion/nvim-asciidoc-preview",
  ft = { "asciidoc" },
  build = 'cd server && npm install --omit=dev',
  ---@module 'asciidoc-preview'
  ---@type asciidoc-preview.Config
  opts = {
    -- Add user configuration here
  },
  config = function()
    vim.keymap.set("n", "<leader>ap", ":AsciiDocPreview<CR>", { noremap = true, silent = true })
  end,
}
