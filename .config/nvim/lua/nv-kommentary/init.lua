-- Kommentary
-- https://github.com/b3nj5m1n/kommentary
--
require('kommentary.config').use_extended_mappings()

-- -------------------------
-- extended mapping defaults
-- -------------------------
-- vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
-- vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
-- vim.api.nvim_set_keymap("v", "<leader>ci", "<Plug>kommentary_visual_increase", {})
-- vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
-- vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
-- vim.api.nvim_set_keymap("v", "<leader>cd", "<Plug>kommentary_visual_decrease", {})



require('kommentary.config').configure_language("rust", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
    -- prefer_single_line_comments = true,
    -- prefer_multi_line_comments = true,
    -- use_consistent_indentation = false,
    -- ignore_whitespace = false,
})
