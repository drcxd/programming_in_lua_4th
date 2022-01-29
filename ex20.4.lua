
local function FileAsArray(FileName)
  local File = assert(io.open(FileName, "r+b"))
  local proxy = {}
  local mt = {
    __index = function (_, i)
      File:seek("set", i)
      return File:read(1)
    end,
    __newindex = function (_, i, b)
      File:seek("set", i)
      File:write(b)
    end
  }
  setmetatable(proxy, mt)
  return proxy
end

local p = FileAsArray("sample.txt")
print(p[0])
-- p[0] = "T"
