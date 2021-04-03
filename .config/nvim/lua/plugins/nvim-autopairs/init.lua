-- ----------------------------------------------------------------------------
-- windwp/nvim-autopairs configuration
--
-- https://github.com/windwp/nvim-autopairs
-- ----------------------------------------------------------------------------
local autopairs = require("nvim-autopairs")
local map = vim.api.nvim_set_keymap

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "NvimTree", "Vista" },
  -- break_line_filetype = nil, -- all file types
  -- html_break_line_filetype = {"html" , "vue" , "typescriptreact" , "svelte" , "javascriptreact"},
  -- ignored_next_char = "%w",
  -- check_line_pair = false,
  -- ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol,
  -- pairs_map = {
  --   ["'"] = "'",
  --   ['"'] = '"',
  --   ['('] = ')',
  --   ['['] = ']',
  --   ['{'] = '}',
  --   ['`'] = '`',
  -- }
})

_G.MUtils = {}

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      require"completion".confirmCompletion()
      return npairs.esc("<c-y>")
    else
      vim.api.nvim_select_popupmenu_item(0, false, false, {})
      require"completion".confirmCompletion()
      return npairs.esc("<c-n><c-y>")
    end
  else
    return npairs.check_break_line_char()
  end
end

map("i", "<CR>", "v:lua.MUtils.completion_confirm()",
    { expr = true, noremap = true })
