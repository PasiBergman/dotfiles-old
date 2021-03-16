
local gl = require('galaxyline')
local gls = gl.section
-- gl.short_line_list = {'LuaTree','vista','dbui'}

local condition = require('galaxyline.condition')
local is_git_workspace = condition.check_git_workspace
local buffer_not_empty = condition.buffer_not_empty
local hide_in_width = condition.hide_in_width

local fileinfo = require('galaxyline.provider_fileinfo')
local fileEncode = fileinfo.get_file_encode
local fileFormat = fileinfo.get_file_format
local fileIconColor = fileinfo.get_file_icon_color
-- local fileName = fileinfo.get_current_file_name
-- local fileIcon = fileinfo.get_file_icon
-- local fileNameInSpecialBuffer = fileinfo.filename_in_special_buffer
-- local defineFileIcon = fileinfo.define_file_icon

local buffer = require('galaxyline.provider_buffer')
local fileTypeName = buffer.get_buffer_filetype

-- Trim beginning and end whitespace from string
local trim_string = function(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- Get file format and endconding
local fileFormatEncode = function()
  local format = trim_string(string.lower(fileFormat()))
  local encode = trim_string(string.lower(fileEncode()))
  return format .. ' [' .. encode .. ']'
end

-- Get current filename relative to CWD
local filenameWithPath = function()
  return vim.api.nvim_exec('echo @%', true)
end

local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  -- darkblue = '#081633',
  darkblue = '#181415',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969',
  textlight = '#d7d7d7',
  textdark= '#1a1a1a'
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = { bg = colors.purple, fg = colors.textlight },
        i = { bg = colors.green, fg = colors.textdark },
        v = { bg = colors.blue, fg = colors.textdark },
        [''] = { bg = colors.blue, fg = colors.textdark },
        V = { bg = colors.blue, fg = colors.textdark },
        c = { bg = colors.purple, fg = colors.textlight },
        no = { bg = colors.magenta, fg = colors.textlight },
        s = { bg = colors.orange, fg = colors.textlight },
        S = { bg = colors.orange, fg = colors.textlight },
        [''] = { bg = colors.orange, fg = colors.textlight },
        ic = { bg = colors.yellow, fg = colors.textlight },
        R = { bg = colors.red, fg = colors.textlight },
        Rv = { bg = colors.red, fg = colors.textlight },
        cv = { bg = colors.red, fg = colors.textlight },
        ce = { bg = colors.red, fg = colors.textlight },
        r = { bg = colors.cyan, fg = colors.textlight },
        rm = { bg = colors.cyan, fg = colors.textlight },
        ['r?'] = { bg = colors.cyan, fg = colors.textlight },
        ['!'] = { bg = colors.red, fg = colors.textlight },
        t = { bg = colors.red, fg = colors.textlight },
      }
      local mode_indicator = {
        n = 'Normal',
        i = 'Insert',
        v = 'Visual',
        [''] = 'V-Block',
        V = 'Visual',
        c = 'Command',
        no = 'no',
        s = 's',
        S = 'S',
        [''] = '^S',
        ic = 'ic',
        R = 'R',
        Rv = 'Rv',
        cv = 'cv',
        ce = 'ce',
        r = 'r',
        rm = 'rm',
        ['r?'] = 'r?',
        ['!']  = '!',
        t = 't'
      }
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()].bg .. ' guifg=' .. mode_color[vim.fn.mode()].fg)
      return '   ' .. mode_indicator[vim.fn.mode()] .. '  '
    end,
    separator = ' ',
    separator_highlight = {colors.yellow,function()
      if not buffer_not_empty then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = {colors.grey,colors.bg,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    separator = ' ',
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}
-- gls.left[4] = {
--   FileName = {
--     provider = {'FileSize'},
--     condition = buffer_not_empty,
--     separator = ' ',
--     separator_highlight = {colors.purple,colors.bg},
--     highlight = {colors.magenta,colors.bg}
--   }
-- }

gls.left[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = function() return is_git_workspace() and hide_in_width() end,
    highlight = {colors.orange,colors.bg},
  }
}
gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    condition = function() return is_git_workspace() and hide_in_width() end,
    highlight = {colors.grey,colors.bg},
  }
}

gls.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = hide_in_width,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}
gls.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = hide_in_width,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = hide_in_width,
    -- separator = ' ',
    -- separator_highlight = {colors.purple,colors.bg},
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}
gls.left[8] = {
  LeftEnd = {
    provider = function() return ' ' end,
    separator = ' ',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.purple,colors.bg}
  }
}
gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[10] = {
  Space = {
    provider = function () return '' end
  }
}
gls.left[11] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' 𥉉 ',
    highlight = {colors.yellow,colors.bg},
  }
}
gls.left[12] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.left[13] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[1] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = function() return buffer_not_empty() and hide_in_width() end,
    highlight = {fileIconColor(),colors.bg},
  },
}
gls.right[2] ={
  FileName = {
    provider =  filenameWithPath,
    condition = function() return buffer_not_empty() and hide_in_width() end,
    highlight = {colors.grey,colors.bg}
  },
}
gls.right[3] = {
  BufferType = {
    provider =  function() return string.lower(fileTypeName()) end,
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg}
  }
}
--[[ gls.right[4]= {
  FileFormat = {
    provider = function() return fileFormat end,
    separator = '',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
} ]]
gls.right[5]= {
  FileEncode = {
    provider =  fileFormatEncode,
    condition = function() return buffer_not_empty() and hide_in_width() end,
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  },
}
gls.right[7] = {
  PerCent = {
    provider = 'LinePercent',
    condition = hide_in_width,
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
--[[ gls.right[4] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.purple},
  }
} ]]
