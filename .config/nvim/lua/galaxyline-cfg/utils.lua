-- Utility functions for e.g. Galaxyline
local lsp_names = {
  bashls = "Bash-ls",
  cssls = "Css-ls",
  dockerls = "Docker-ls",
  efm = "Efm-ls",
  jsonls = "Json-ls",
  omnisharp = "OmniSharp",
  pyright = "Python-ls ",
  sumneko_lua = "Lua-ls",
  tsserver = "TypeScript-ls",
  vimls = "Vim-ls",
  vuels = "Vue-ls",
  yamlls = "Yaml-ls",
}

local M = {}

M.icons = {
  -- Default separator for multiple active LSPs
  separator = " ",
  -- Default icon for indicating formatting capability with a formatter
  formatter_icon = " ",
  -- Default icon for indicating formatter capability with a linter
  linter_icon = " ﮒ ",
  -- Default icon for indicating code action capability
  code_action_icon = " ",
  -- Default icon for global formatter/linter
  global_icon = "",
  -- Default icon for local/project formatter/linter
  local_icon = "",
}

-- Trim beginning and end separator/space from string
M.trim_string = function(str, sep)
  sep = sep or "%s"
  return str:gsub("^" .. sep .. "*(.-)" .. sep .. "*$", "%1")
end

--
-- Get formatter or linter command
--
local get_command = function(command)
  if string.find(command, "node_modules/.bin/eslint") then
    return M.icons.local_icon .. " Eslint"
  end
  if string.find(command, "eslint_d") then
    return M.icons.global_icon .. " Eslint"
  end
  if string.find(command, "node_modules/.bin/prettier") then
    return M.icons.local_icon .. " Prettier"
  end
  if string.find(command, "prettier") then
    return M.icons.global_icon .. " Prettier"
  end

  local space_idx = string.find(command, " ")
  if space_idx then command = string.sub(command, 1, space_idx) end
  local slash_idx = string.find(command, "/[^/]*$")
  if slash_idx then command = string.sub(command, slash_idx + 1) end
  return M.trim_string(command, M.icons.separator)
end

local is_efm_ls = function(lsp_client)
  if not lsp_client then return false end
  if lsp_client.name == "efm" then return true end
  return false
end

--
-- Get formatter or linter command configured for EFM ls
--
local get_efm_command = function(lsp_client,
                                 buffer_filetype,
                                 commandType)
  -- If not efm, return with empty string
  if not is_efm_ls(lsp_client) then return "" end

  -- efm configuration
  local lang_settings = lsp_client.config.settings.languages[buffer_filetype]
  if not lang_settings then return "" end

  local command = ""
  for _, lang_setting in ipairs(lang_settings) do
    command = lang_setting[commandType]
    if (command and command ~= "") then break end
  end
  if not command then return "" end

  return get_command(command)
end

-- Convert original LSP name to based on the lsp_names table
local map_lsp_name = function(name)
  local lsp_name = lsp_names[name] or name
  return lsp_name
end

--
-- Exported get_active_lsp_info function
-- Separator and icons are optional arguments
--
M.get_active_lsp_info = function(
    clients,
    file_type,
    separator,
    formatter_icon,
    linter_icon,
    code_action_icon,
    global_icon,
    local_icon
)
  if (clients == nil or file_type == nil) then return "" end

  M.icons.separator = separator or M.icons.separator
  M.icons.formatter_icon = formatter_icon or M.icons.formatter_icon
  M.icons.linter_icon = linter_icon or M.icons.linter_icon
  M.icons.code_action_icon = code_action_icon or M.icons.code_action_icon
  M.icons.global_icon = global_icon or M.icons.global_icon
  M.icons.local_icon = local_icon or M.icons.local_icon

  local lsp_clients = ""
  for _, client in ipairs(clients) do
    local capabilities = client.resolved_capabilities
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, file_type) ~= -1 then
      -- Get mapped LSP name from table
      local ls = map_lsp_name(client.name)
      -- If efm ls, get formatter
      local formatterCommand = get_efm_command(client, file_type,
                                               "formatCommand")
      -- If efm ls, get linter
      local linterCommand = get_efm_command(client, file_type, "lintCommand")
      -- If linter command and formatter command are identical, use only one of them
      if linterCommand ~= "" and linterCommand == formatterCommand then
        linterCommand = linterCommand .. M.icons.formatter_icon
        formatterCommand = ""
      end
      -- If LSP client has document formatting or range formatting capability
      if capabilities.document_formatting or
          capabilities.document_range_formatting then

        -- If formatteerCommand or linterCommand is not empty
        if formatterCommand ~= "" or linterCommand ~= "" then
          -- Reset lsp name - use formatter or linter command instead
          ls = ""
          -- Formatter with icon
          if formatterCommand ~= "" then
            ls = formatterCommand .. M.icons.formatter_icon .. " "
          end
          -- Linter with icon
          if linterCommand ~= "" then
            ls = ls .. linterCommand .. M.icons.linter_icon
          end
          -- Document formatting capability, but not with efm ls
        else
          ls = ls .. M.icons.formatter_icon
        end
      end
      -- If LSP client has code action capability
      if capabilities.code_action then ls = ls .. M.icons.code_action_icon end
      -- If LSP is not in the list yet...add it
      if not string.find(lsp_clients, ls) then
        lsp_clients = lsp_clients .. ls .. M.icons.separator
      end
    end
  end

  return M.trim_string(lsp_clients, M.icons.separator)
end

return M
