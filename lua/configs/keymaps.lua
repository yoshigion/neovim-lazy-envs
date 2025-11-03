-- lua/config/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

---- nvim-tree.lua
-- Ctrl-e to toggle nvim-tree
map("n", "<C-e>", ":NvimTreeToggle<CR>", opts)

---- copilotchat.lua: avoid conflict <Tab>
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

