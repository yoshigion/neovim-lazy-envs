-- lua/plugins/llm.lua
return {
  "huggingface/llm.nvim",
  event = "VeryLazy",

  config = function()
    ----------------------------------------------------
    -- llm.nvim 基本設定
    ----------------------------------------------------
    require("llm").setup({
      model = "gpt-4o-mini",  -- 好きなモデルに変更可
      api_token = os.getenv("OPENAI_API_KEY"),
      temperature = 0.2,
      max_tokens = 256,
    })

    local llm = require("llm")

    ----------------------------------------------------
    -- カーソル前後の文脈を抽出（2000 文字）
    ----------------------------------------------------
    local function get_context(max_chars)
      local buf = vim.api.nvim_get_current_buf()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local text = table.concat(lines, "\n")

      local cursor_pos = 0
      for i = 1, row - 1 do
        cursor_pos = cursor_pos + #lines[i] + 1
      end
      cursor_pos = cursor_pos + col

      local start_pos = math.max(1, cursor_pos - max_chars)
      local end_pos   = math.min(#text, cursor_pos + max_chars)

      return text:sub(start_pos, end_pos)
    end

    ----------------------------------------------------
    -- プロンプト生成（Copilot と同じ “続きを書け” 方式）
    ----------------------------------------------------
    local function build_prompt(context)
      return table.concat({
        "以下のコードの続きを書いてください。",
        "カーソル位置に挿入すべきコードのみ返してください。",
        "既存コードを壊す変更はしないでください。",
        "",
        context
      }, "\n")
    end

    ----------------------------------------------------
    -- 差分をカーソル位置に挿入（複数行対応）
    ----------------------------------------------------
    local function apply_inline_completion(text)
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local lines = vim.split(text, "\n", { plain = true })
      vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, lines)
    end

    ----------------------------------------------------
    -- LLM に補完を依頼
    ----------------------------------------------------
    local function request_inline_completion()
      local context = get_context(2000)
      local prompt = build_prompt(context)

      llm.complete(prompt, function(result)
        if result and result.text then
          apply_inline_completion(result.text)
        end
      end)
    end

    ----------------------------------------------------
    -- キーマップ（Copilot と同じ <C-l>）
    ----------------------------------------------------
    vim.keymap.set("i", "<C-l>", function()
      request_inline_completion()
    end, { desc = "LLM inline completion" })
  end,
}

