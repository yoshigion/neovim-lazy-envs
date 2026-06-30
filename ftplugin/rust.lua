local bufnr = vim.api.nvim_get_current_buf()
local map = function(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

-- ホバーアクション（2回押すとウィンドウ内に入って選択できる）
map('K',          function() vim.cmd.RustLsp({ 'hover', 'actions' }) end, 'Rust hover actions')
-- グルーピング対応のコードアクション
map('<leader>ca', function() vim.cmd.RustLsp('codeAction') end,           'Rust code action')
-- 実行 / デバッグ / テスト
map('<leader>rr', function() vim.cmd.RustLsp('runnables') end,            'Rust runnables')
map('<leader>rd', function() vim.cmd.RustLsp('debuggables') end,          'Rust debuggables')
map('<leader>rt', function() vim.cmd.RustLsp('testables') end,            'Rust testables')
-- 便利系
map('<leader>rm', function() vim.cmd.RustLsp('expandMacro') end,          'Expand macro')
map('<leader>re', function() vim.cmd.RustLsp({ 'explainError' }) end,     'Explain error')
map('<leader>rD', function() vim.cmd.RustLsp({ 'renderDiagnostic' }) end, 'Render diagnostic')
map('<leader>rc', function() vim.cmd.RustLsp('openCargo') end,            'Open Cargo.toml')
map('<leader>ro', function() vim.cmd.RustLsp('openDocs') end,             'Open docs.rs')
