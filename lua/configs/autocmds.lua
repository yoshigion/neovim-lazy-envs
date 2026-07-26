-- lua/config/autocmds.lua

vim.lsp.enable("efm")

--local group = vim.api.nvim_create_augroup("MyAutoCmds", { clear = true })

-- 保存時に自動でフォーマット
--vim.api.nvim_create_autocmd("BufWritePre", {
--  group = group,
--  pattern = "*",
--  callback = function()
--    vim.lsp.buf.format({ async = false })
--  end,
--})
