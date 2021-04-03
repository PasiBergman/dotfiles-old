require"bufferline".setup {
  options = {
    view = "default",
    -- numbers = "buffer_id", -- "buffer_id",
    -- number_style = "superscript",
    mappings = false, -- | false,
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 50,
    max_prefix_length = 36, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thin", -- | "slant" | "thick" | { 'any', 'any' },
    enforce_regular_tabs = false, -- | true,
    always_show_bufferline = true, -- | false,
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    diagnostics_indicator = function(_, level)
      if level:match("error") then return " " end
      return ""
    end,
    --[[ sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.modified > buffer_b.modified
    end ]]
  },
}

