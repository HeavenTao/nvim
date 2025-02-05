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

return _M
