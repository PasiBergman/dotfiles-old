local builtin = require('telescope.builtin')
local fzf = require('telescope').extensions.fzf_writer

local M = {}
M.search_dotfiles = function()
   builtin.find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/.config/",
    })
end

M.search_nvim = function()
   builtin.find_files({
        prompt_title = "< Nvim >",
        cwd = "$HOME/.config/nvim",
    })
end

M.fzf_dotfiles = function()
   builtin.find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/.config/",
    })
end

M.fzf_nvim = function()
   fzf.files({
        prompt_title = "< Nvim >",
        cwd = "$HOME/.config/nvim",
    })
end

M.fzf_grep = function()
   fzf.grep()
end

-- Example of adding e.g. key mappings to existing function
--
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<cr>', actions.git_track_branch)
            map('n', '<cr>', actions.git_track_branch)
            return true
        end
    })
end

return M
