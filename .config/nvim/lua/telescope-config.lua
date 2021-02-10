--
-- Configuration for Telescope.nvim
--
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=auto',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = " 🔍",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    file_previewer = require'telescope.previewers'.cat.new,
    -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new,
    -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
    qflist_previewer = require'telescope.previewers'.qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- Fuzzy find over vimspector configurations
-- require('telescope').load_extension('vimspector')
-- require('telescope').extensions.vimspector.configurations()

-- FZY styled sorter that is compiled
-- require('telescope').load_extension('fzy_native')
