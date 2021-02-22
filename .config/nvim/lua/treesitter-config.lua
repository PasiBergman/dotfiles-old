-- Nvim Treesitter configuration
-- https://github.com/nvim-treesitter/nvim-treesitter#language-parsers

require'nvim-treesitter.configs'.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "bash",
    "c_sharp",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "tsx",
    "typescript",
    "vue",
    "yaml",
  },
  highlight = {
    enable = true,   -- false will disable the whole extension
    disable = {},    -- list of language that will be disabled
  },
}
