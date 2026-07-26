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
map("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

-- CodeCompanion (<leader>a = AI prefix で統一)
map({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat<cr>",        { desc = "[AI] Chat を開く" })
map({ "n", "v" }, "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "[AI] Chat トグル" })
map("n",          "<leader>ai", "<cmd>CodeCompanion<cr>",            { desc = "[AI] インライン編集" })
map("v",          "<leader>ai", ":CodeCompanion<cr>",                { desc = "[AI] 選択範囲をインライン編集" })
map({ "n", "v" }, "<leader>as", "<cmd>CodeCompanionChat Add<cr>",    { desc = "[AI] 選択をチャットへ" })

-- diagnostic keymaps
map("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "次の診断へジャンプしてフロート表示" })
map("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "前の診断へジャンプしてフロート表示" })
