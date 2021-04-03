require"telescope".load_extension "node_modules"

-- Key mappings
vim.api.nvim_set_keymap("n", "<Leader>fn", ":Telescope node_modules list<CR>",
                        { noremap = true, silent = true })
