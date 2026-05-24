-- lua/plugins/copilot-cmp.lua
return {
  "zbirenbaum/copilot-cmp",
  dependencies = { "zbirenbaum/copilot.lua" },
  init = function()
    -- upstream Issue #131 修正まで: deprecated API を手動パッチ
    local path = vim.fn.stdpath("data") .. "/lazy/copilot-cmp/lua/copilot_cmp/source.lua"
    local content = vim.fn.readfile(path)
    local patched = false
    for i, line in ipairs(content) do
      local new_line = line:gsub("self%.client%.is_stopped%(%)", "self.client:is_stopped()")
      if new_line ~= line then
        content[i] = new_line
        patched = true
      end
    end
    if patched then
      vim.fn.writefile(content, path)
    end
  end,
  config = function()
    require("copilot_cmp").setup()
  end,
}
