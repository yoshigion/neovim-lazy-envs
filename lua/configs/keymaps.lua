-- lua/config/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

---- nvim-tree.lua
-- Ctrl-e to toggle nvim-tree
map("n", "<C-e>", ":NvimTreeToggle<CR>", opts)

---- telescope.lua
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

---- copilotchat.lua: avoid conflict <Tab>
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
