local gl = require("galaxyline")
local gls = gl.section
-- gl.short_line_list = {'LuaTree','vista','dbui'}

local condition = require("galaxyline.condition")
local is_git_workspace = condition.check_git_workspace
local buffer_not_empty = condition.buffer_not_empty
local hide_in_width = condition.hide_in_width

local fileinfo = require("galaxyline.provider_fileinfo")
local fileEncode = fileinfo.get_file_encode
local fileFormat = fileinfo.get_file_format
local fileIconColor = fileinfo.get_file_icon_color
local fileName = fileinfo.get_current_file_name
-- local fileIcon = fileinfo.get_file_icon
-- local fileNameInSpecialBuffer = fileinfo.filename_in_special_buffer
-- local defineFileIcon = fileinfo.define_file_icon

local buffer = require("galaxyline.provider_buffer")
local fileTypeName = buffer.get_buffer_filetype

local vcs = require("galaxyline.provider_vcs")
-- GitBranch = vcs.get_git_branch,
-- diffadd = vcs.diff_add,             -- support vim-gitgutter vim-signify gitsigns
-- diffmodified = vcs.diff_modified,   -- support vim-gitgutter vim-signify gitsigns
-- diffremove = vcs.diff_remove,

-- Trim beginning and end whitespace from string
local trim_string = function(s) return (s:gsub("^%s*(.-)%s*$", "%1")) end

local get_git_changes = function()
  if not is_git_workspace() then return "" end

  local diffs = ""
  local add_nr = vcs.diff_add()
  local mod_nr = vcs.diff_modified()
  local rem_nr = vcs.diff_remove()

  if not add_nr and not mod_nr and not rem_nr then return diffs end

  local add_icon = "+"
  local mod_icon = "~"
  local rem_icon = "-"

  if add_nr then diffs = diffs .. add_icon .. trim_string(add_nr) .. " " end
  if rem_nr then diffs = diffs .. rem_icon .. trim_string(rem_nr) .. " " end
  if mod_nr then diffs = diffs .. mod_icon .. trim_string(mod_nr) .. " " end

  return "[" .. trim_string(diffs) .. "]"
end

-- Get file format and endconding
local fileFormatEncode = function()
  local format = trim_string(string.lower(fileFormat()))
  local encode = trim_string(string.lower(fileEncode()))
  return format .. " [" .. encode .. "]"
end

-- Get current filename relative to CWD
local filenameWithPath =
    function() return vim.api.nvim_exec("echo @%", true) end

-- Get LSP clients -
-- The build int function does not support multiple clients
local get_lsp_clients = function(msg, separator)
  msg = msg or ""
  separator = separator or " "

  -- Integrated condition for narrow window
  if not hide_in_width() then return "" end

  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return msg end

  local lsp_clients = "" -- Could use a table, but I won't.
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      if not string.find(lsp_clients, client.name) then
        lsp_clients = lsp_clients .. client.name .. separator
      end
    end
  end
  lsp_clients = trim_string(lsp_clients)
  return lsp_clients or msg
end

local colors = {
  -- bg = '#282c34',
  bg = "#2c323c",
  yellow = "#fabd2f",
  cyan = "#008080",
  -- darkblue = '#081633',
  darkblue = "#181415",
  green = "#608B4E",
  orange = "#AA8800",
  purple = "#5d4d7a",
  magenta = "#d16d9e",
  grey = "#c0c0c0",
  blue = "#569CD6",
  red = "#D16969",
  textlight = "#d7d7d7",
  textdark = "#1a1a1a",
}

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = { bg = colors.purple, fg = colors.textlight },
        i = { bg = colors.green, fg = colors.textdark },
        v = { bg = colors.blue, fg = colors.textdark },
        [""] = { bg = colors.blue, fg = colors.textdark },
        V = { bg = colors.blue, fg = colors.textdark },
        c = { bg = colors.purple, fg = colors.textlight },
        no = { bg = colors.magenta, fg = colors.textlight },
        s = { bg = colors.orange, fg = colors.textlight },
        S = { bg = colors.orange, fg = colors.textlight },
        [""] = { bg = colors.orange, fg = colors.textlight },
        ic = { bg = colors.yellow, fg = colors.textlight },
        R = { bg = colors.red, fg = colors.textlight },
        Rv = { bg = colors.red, fg = colors.textlight },
        cv = { bg = colors.red, fg = colors.textlight },
        ce = { bg = colors.red, fg = colors.textlight },
        r = { bg = colors.cyan, fg = colors.textlight },
        rm = { bg = colors.cyan, fg = colors.textlight },
        ["r?"] = { bg = colors.cyan, fg = colors.textlight },
        ["!"] = { bg = colors.red, fg = colors.textlight },
        t = { bg = colors.red, fg = colors.textlight },
      }
      local mode_indicator = {
        n = "Normal",
        i = "Insert",
        v = "Visual",
        [""] = "V-Block",
        V = "Visual",
        c = "Command",
        no = "no",
        s = "s",
        S = "S",
        [""] = "^S",
        ic = "ic",
        R = "R",
        Rv = "Rv",
        cv = "cv",
        ce = "ce",
        r = "r",
        rm = "rm",
        ["r?"] = "r?",
        ["!"] = "!",
        t = "t",
      }
      vim.api.nvim_command("hi GalaxyViMode guibg=" ..
                               mode_color[vim.fn.mode()].bg .. " guifg=" ..
                               mode_color[vim.fn.mode()].fg)
      return "   " .. mode_indicator[vim.fn.mode()] .. "  "
    end,
    separator = " ",
    separator_highlight = {
      colors.yellow,
      function()
        if not buffer_not_empty then return colors.bg end
        return colors.bg
      end,
    },
    highlight = { colors.grey, colors.bg, "bold" },
  },
}

gls.left[2] = {
  GitBranch = {
    icon = "  ",
    provider = "GitBranch",
    separator = " ",
    separator_highlight = { colors.purple, colors.bg },
    condition = function() return is_git_workspace() and hide_in_width() end,
    highlight = { colors.grey, colors.bg },
  },
}

--[[
gls.left[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = hide_in_width,
    icon = "  ",
    highlight = { colors.gray, colors.bg },
  },
}

gls.left[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = hide_in_width,
    icon = "  ",
    highlight = { colors.gray, colors.bg },
  },
}

gls.left[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = hide_in_width,
    icon = "  ",
    highlight = { colors.gray, colors.bg },
  },
}
]]

gls.left[5] = {
  FileIcon = {
    provider = "FileIcon",
    condition = function() return buffer_not_empty() end,
    highlight = { fileIconColor(), colors.bg },
  }
}

gls.left[6] = {
  ShortFileName = {
    provider = fileName,
    condition = function() return not hide_in_width() and buffer_not_empty() end,
    highlight = { colors.grey, colors.bg },
  },
}

gls.left[7] = {
  FileName = {
    provider = filenameWithPath,
    condition = function() return buffer_not_empty() and hide_in_width() end,
    highlight = { colors.grey, colors.bg },
  },
}

gls.left[8] = {
  DiffChangeInfo = {
    provider = function() return get_git_changes() end,
    highlight = { colors.gray, colors.bg },
  },
}

gls.left[9] = {
  LeftEnd = {
    provider = function() return " " end,
    separator = " ",
    separator_highlight = { colors.purple, colors.bg },
    highlight = { colors.purple, colors.bg },
  },
}

gls.right[1] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = { colors.red, colors.bg },
  },
}
gls.right[2] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = " 𥉉",
    highlight = { colors.yellow, colors.bg },
  },
}
gls.right[3] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = { colors.gray, colors.bg },
  },
}
gls.right[4] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = { colors.gray, colors.bg },
  },
}
gls.right[5] = {
  ShowLspClient = {
    provider = get_lsp_clients,
    condition = get_lsp_clients,
    icon = "歷", --  
    highlight = { colors.grey, colors.bg },
  },
}
gls.right[6] = {
  BufferType = {
    provider = function() return string.lower(fileTypeName()) end,
    separator = " | ",
    separator_highlight = { colors.darkblue, colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}
gls.right[7] = {
  FileEncode = {
    provider = fileFormatEncode,
    condition = function() return buffer_not_empty() and hide_in_width() end,
    separator = " | ",
    separator_highlight = { colors.darkblue, colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}
gls.right[8] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " | ",
    separator_highlight = { colors.darkblue, colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}
gls.right[9] = {
  PerCent = {
    provider = "LinePercent",
    condition = hide_in_width,
    separator = " | ",
    separator_highlight = { colors.darkblue, colors.bg },
    highlight = { colors.grey, colors.bg },
  },
}