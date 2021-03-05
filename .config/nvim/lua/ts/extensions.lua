local builtin = require('telescope.builtin')

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

return M
