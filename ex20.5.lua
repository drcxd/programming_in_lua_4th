
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
    end,
    __pairs = function ()
      return function (_, i)
        i = i or 0
        File:seek("set", i)
        local v = File:read(1)
        i = i + 1
        return i, v
      end
    end,
    __len = function ()
      return File:seek("end")
    end
  }
  setmetatable(proxy, mt)
  return proxy
end

local p = FileAsArray("ex20.5.lua")
print(#p)
-- print(p[0])
-- p[0] = "T"
for _, b in pairs(p) do
  io.write(b)
end
