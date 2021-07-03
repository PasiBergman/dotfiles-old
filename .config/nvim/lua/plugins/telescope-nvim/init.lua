-- ----------------------------------------------------------------------------
-- Telescope.nvim
--
-- https://github.com/nvim-telescope/telescope.nvim
-- ----------------------------------------------------------------------------
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
--
-- Configuration for Telescope.nvim
--
require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    file_sorter = sorters.get_fzy_sorter,
    -- Experiment by Pasi
    generic_sorter = sorters.get_fzy_sorter,
    scroll_strategy = "cycle",
    selection_strategy = "reset",
    layout_strategy = "flex",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    layout_config = {
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-å>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },

    set_env = { ["COLORTERM"] = "truecolor" },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = " ",
    initial_mode = "insert",
    sorting_strategy = "descending",
    file_ignore_patterns = { "node_modules", ".git", "tmp" },
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
      },
    },
  },
}


local nmap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- File pickers
nmap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
nmap("n", "<leader>fi", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
nmap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
nmap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
nmap("n", "<leader>fF", "<cmd>lua require('telescope.builtin').file_browser()<cr>", opts)

-- Vim pickers
nmap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
nmap("n", "<leader>vf", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
nmap("n", "<leader>vc", "<cmd>lua require('telescope.builtin').commands()<cr>", opts)
nmap("n", "<leader>vh", "<cmd>lua require('telescope.builtin').command_history()<cr>", opts)
nmap("n", "<leader>mp", "<cmd>lua require('telescope.builtin').man_pages()<cr>", opts)
nmap("n", "<leader>m", "<cmd>lua require('telescope.builtin').marks()<cr>", opts)
nmap("n", "<leader>vC", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", opts)
nmap("n", "<leader>vq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", opts)
nmap("n", "<leader>vl", "<cmd>lua require('telescope.builtin').loclist()<cr>", opts)
nmap("n", "<leader>vo", "<cmd>lua require('telescope.builtin').vim_options()<cr>", opts)
nmap("n", "<leader>vr", "<cmd>lua require('telescope.builtin').registers()<cr>", opts)
nmap("n", "<leader>va", "<cmd>lua require('telescope.builtin').autocommands()<cr>", opts)
nmap("n", "<leader>vs", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>", opts)
nmap("n", "<leader>vk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", opts)
nmap("n", "<leader>vt", "<cmd>lua require('telescope.builtin').filetypes()<cr>", opts)
nmap("n", "<leader>vH", "<cmd>lua require('telescope.builtin').highlights()<cr>", opts)
nmap("n", "<leader>vz", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_lines()<cr>", opts)

-- LSP Pickers
nmap("n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
nmap("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
nmap("n", "<leader>lS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
nmap("n", "<leader>la", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", opts)
nmap("n", "<leader>lA", "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>", opts)

-- Git Pickers
nmap("n", "<leader>ic", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
nmap("n", "<leader>iC", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", opts)
nmap("n", "<leader>ib", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
nmap("n", "<leader>is", "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)

-- Treesitter Picker
nmap("n", "<leader>tt", "<cmd>lua require('telescope.builtin').treesitter()<cr>", opts)

-- Ultisnips
nmap("n", "<leader>vu", "<cmd>lua require('telescope').extensions.ultisnips.ultisnips{}<CR>", opts)

-- Custom searches
nmap("n", "<Leader>fc", "<cmd>lua require('plugins.telescope-nvim.extensions').search_dotfiles()<cr>", opts)
nmap("n", "<Leader>fv", "<cmd>lua require('plugins.telescope-nvim.extensions').search_nvim()<cr>", opts)
nmap("n", "<Leader>fw", "<cmd>lua require('plugins.telescope-nvim.extensions').search_wiki()<cr>", opts)
nmap("n", "<Leader>fW", "<cmd>lua require('plugins.telescope-nvim.extensions').grep_wiki()<cr>", opts)

