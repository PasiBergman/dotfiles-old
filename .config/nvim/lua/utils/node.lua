-- ----------------------------------------------------------------------------
-- Common NPM and Node based (JavaScript/TypeScript) utility functions
-- ----------------------------------------------------------------------------
local M = {}

-- Verbose logger switch
local print_results = false

-- Formatter commands
M.prettier_local_command = "prettier --stdin-filepath ${INPUT}"
M.prettier_global_command =
    "./node_modules/.bin/prettier --stdin-filepath ${INPUT}"
M.eslint_d_command =
    "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}"

-- Verbose logger
local print_result = function(is_result, true_result, false_result)
  if not print_results then return end

  if is_result then
    print(true_result)
  else
    print(false_result)
  end
end

-- Does file or path exist? Handles also wildcards.
local is_glob = function(glob)
  local is_result = vim.fn.glob(glob) ~= ""
  print_result(is_result, "Glob " .. glob .. " found.",
               "Glob " .. glob .. " not found.")
  return is_result
end

-- Does package.json file contain speficied field?
local in_package_json = function(field)
  if vim.fn.filereadable("package.json") ~= 0 then
    local package_json = vim.fn.json_decode(vim.fn.readfile("package.json"))
    local is_result = package_json[field] ~= nil
    print_result(is_result, "Field " .. field .. " found in package.json",
                 "Field " .. field .. " not found in package.json")
    return is_result
  end
  return false
end

-- Is there a local (development) Prettier package?
local is_local_prettier = function()
  local is_local = is_glob("./node_modules/.bin/prettier")
  print_result(is_local, "Using local Prettier.", "Using global Prettier.")
  return is_local
end

-- Is there a Prettier configuration in the project
local is_prettier_config = function()
  local is_prettier = is_glob(".prettierrc*") or in_package_json("prettier")
  print_result(is_prettier, "Project using Prettier.", "Not using Prettier.")
  return is_prettier
end

-- Is there a Eslint configuration
local is_eslint_config = function()
  local is_result = is_glob(".eslintrc*") or in_package_json("eslintConfig")
  print_result(is_result, "Eslint configuration found.",
               "Eslint configuration not found.")
  return is_result
end

-- Get formatter command
M.get_formatter_command = function()
  if is_prettier_config() then
    if is_local_prettier() then
      print("Document formatter: local Prettier")
      return M.prettier_local_command
    else
      print("Document formatter: local Prettier")
      return M.prettier_global_command
    end
  elseif is_eslint_config() then
    print("Document formatter: global eslint_d")
    return M.eslint_d_command
  else
    print_result(true, "Could not find formatter command.", "")
    return ""
  end
end

return M
