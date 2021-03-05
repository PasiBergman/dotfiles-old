-- Nvim Treesitter configuration
-- https://github.com/nvim-treesitter/nvim-treesitter#language-parsers

require'nvim-treesitter.configs'.setup({
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"typescript", "c_sharp", "css", "html", "javascript", "json", "lua", "python", "regex", "vue", "yaml"},
  highlight = {
    enable = true,   -- false will disable the whole extension
    custom_captures = {},
    disable = {},    -- list of language that will be disabled
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "tis",
      node_incremental = "tns",
      scope_incremental = "tss",
      node_decremental = "tnd",
    },
  },

  indent = {
    enable = true
  },
})


-- vim.api.nvim_exec([[
--   set foldmethod=expr
--   set foldexpr=nvim_treesitter#foldexpr()
-- ]], true)
