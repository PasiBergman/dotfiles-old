-- ----------------------------------------------------------------------------
-- phaazon/hop.nvim configurattion
--
-- https://github.com/phaazon/hop.nvim
-- ----------------------------------------------------------------------------
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 }

-- place this in one of your configuration file(s)
local map = vim.api.nvim_set_keymap

map('n', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
map('n', '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
map('n', '<leader>hp', "<cmd>lua require'hop'.hint_patterns()<cr>", {})
map('n', '<leader>S', "<cmd>lua require'hop'.hint_char2()<cr>", {})
map('n', '<leader>s', "<cmd>lua require'hop'.hint_char1()<cr>", {})

