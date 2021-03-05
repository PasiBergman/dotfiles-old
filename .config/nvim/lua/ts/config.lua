local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')
--
-- Configuration for Telescope.nvim
--
require('telescope').setup{
  defaults = {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    file_sorter = sorters.get_fzy_sorter,
    scroll_strategy = 'cycle',
    selection_strategy = 'reset',
    layout_strategy = 'flex',
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5
      }
    },
    set_env = { ['COLORTERM'] = 'truecolor' },
    prompt_position = 'bottom',
    prompt_prefix = ' > ',
    initial_mode = 'insert',
    sorting_strategy = 'descending',
    file_ignore_patterns = {"node_modules", ".git", "tmp", "coc/data", "undodir", "autoload"},
    winblend = 12,
    color_devicons = true,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

