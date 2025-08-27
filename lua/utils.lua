local _M = {}

_M.get_os_name = function()
  local file = io.open("/etc/os-release", "r")
  if not file then
    return nil
  end

  local content = file:read "a"
  file:close()

  local id = content:match "ID=(%a+)"
  if id then
    id = id:gsub('"', "")
    return id
  end

  return nil
end

_M.get_current_test_name = function()
  local node = vim.treesitter.get_node()
  if not node then
    return nil
  end

  while node do
    if node:type() == "test_declaration" then
      for child in node:iter_children() do
        if child:type() == "string" then
          local name = vim.treesitter.get_node_text(child, 0)
          return name
        end
      end
    end
    node = node:parent()
  end

  return nil
end

return _M
