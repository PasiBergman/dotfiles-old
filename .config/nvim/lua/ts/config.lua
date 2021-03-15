
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')
--
-- Configuration for Telescope.nvim
--
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    file_sorter = sorters.get_fzy_sorter,
    -- Experiment by Pasi
    generic_sorter = sorters.get_fzy_sorter,
    scroll_strategy = 'cycle',
    selection_strategy = 'reset',
    layout_strategy = 'flex',
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },

    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-s>'] = actions.select_horizontal,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<C-å>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },

    set_env = { ['COLORTERM'] = 'truecolor' },
    prompt_position = 'bottom',
    prompt_prefix = '> ',
    selection_caret = '> ',
    entry_prefix = ' ',
    initial_mode = 'insert',
    sorting_strategy = 'descending',
    file_ignore_patterns = {
      'node_modules',
      '.git',
      'tmp'
    },
    winblend = 12,
    color_devicons = true,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
      minimum_grep_characters = 3,
      minimum_file_characters = 3,
    },
    extensions = {
      fzf_writer = {
        minimum_grep_characters = 3,
        minimum_files_characters = 3,

        -- Disabled by default.
        -- Will probably slow down some aspects of the sorter, but can make color highlights.
        -- I will work on this more later.
        use_highlighter = true,
      }
    }
  }
}

