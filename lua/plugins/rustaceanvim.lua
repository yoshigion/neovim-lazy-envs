-- lua/plugins/rustaceanvim.lua
return {
  "mrcjkb/rustaceanvim",
  version = '^9',   -- breaking changeを避けてメジャー固定
  lazy = false,     -- 自前で適切にlazy-loadされるので lazy.nvim 側の遅延は不要
  init = function()
    -- vim.g.rustaceanvim は「関数を返す」形にすると、
    -- cmp_nvim_lsp の読み込み順を気にせず capabilities を渡せる
    vim.g.rustaceanvim = function()
      return {
        server = {
          -- 既存の nvim-cmp と補完を接続。
          -- もし vim.lsp.config('*', { capabilities = ... }) で
          -- 全サーバ共通設定済みなら、この行は省略してOK（自動で継承される）
          capabilities = require('cmp_nvim_lsp').default_capabilities(),

          default_settings = {
            ['rust-analyzer'] = {
              cargo = { allFeatures = true },
              checkOnSave = true,
              check = { command = 'clippy' }, -- 保存時に clippy を回す
              -- inlayHints などもここに rust-analyzer の設定キーで追加できる
            },
          },
        },
      }
    end
  end,
}
