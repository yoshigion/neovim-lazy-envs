-- ~/.config/nvim/lsp/efm.lua
-- efm-langserver 経由で textlint を AsciiDoc の診断として使う設定。
-- Neovim 0.11+ のネイティブ LSP 設定方式 (vim.lsp.config / vim.lsp.enable) 前提。
-- lua/plugins/lsp.lua 側の vim.lsp.enable({ ... }) に "efm" を含めること。

return {
  cmd = { "efm-langserver" },

  -- .adoc / .asciidoc は Neovim 標準の filetype 検出で asciidoc になる
  filetypes = { "asciidoc" },

  -- プロジェクトルートの判定。.textlintrc.json を最優先にすることで
  -- プロジェクトローカルの textlint 設定が使われる
  root_markers = { ".textlintrc.json", ".textlintrc", "package.json", ".git" },

  init_options = {
    documentFormatting = false,
    documentRangeFormatting = false,
  },

  -- Neovim組み込みの増分同期(Incremental Sync)は、日本語などマルチバイト文字を
  -- 含む編集で compute_end_range が assertion failed になることがあるため、
  -- 常に全文同期(Full Sync)を使うようにする。
  flags = {
    allow_incremental_sync = false,
  },

  settings = {
    rootMarkers = { ".textlintrc.json", ".textlintrc", ".git/" },
    languages = {
      asciidoc = {
        {
          -- グローバルインストール(npm install -g)前提で textlint を直接呼ぶ。
          -- プロジェクトローカル運用に戻す場合は
          -- "npx --no-install textlint --format unix --stdin --stdin-filename ${INPUT}" に変更。
          -- ${INPUT} を --stdin-filename に渡すことで textlint-plugin-asciidoctor が
          -- 拡張子 .adoc を認識して AsciiDoc パーサーを選択する。
          lintCommand = "textlint --format unix --stdin --stdin-filename ${INPUT}",
          lintStdin = true,
          -- textlint --format unix の出力: /path/file.adoc:12:5: メッセージ [ルール名]
          lintFormats = { "%f:%l:%c: %m" },
          -- textlint は指摘ありのとき exit code 1 を返すのでエラー扱いにしない
          lintIgnoreExitCode = true,
          lintSource = "textlint",
          rootMarkers = { ".textlintrc.json", ".textlintrc" },
        },
      },
    },
  },
}
