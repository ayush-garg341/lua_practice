path = '/Users/elliott/some-project-name/src/bid_reduction_script/helpers/py'
project_name = 'some-project-name'


-- ([^%w]): Matches any character that is not a letter or number (i.e., special characters)
-- "%%%1": Adds a % before that character to escape it
-- some-project-name -> some%-project%-name
-- path.to/file -> path%.to%/file

local function escape_lua_pattern(s)
  return s:gsub("([^%w])", "%%%1")
end

function get_relative_file_path(full_path, project_name)
  project_name = escape_lua_pattern(project_name)
  local rel_path = full_path:gsub(".*" .. project_name .. "/", "")
  return rel_path
end

print(get_relative_file_path(path, project_name))

