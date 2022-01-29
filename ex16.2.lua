local function multiload(...)
  local t = {...}
  local n = #t
  local last = nil
  local i = 1
  return load(function ()
      if last then
        local res = last()
        if not res then
          last = nil
        else
          return res
        end
      end
      local current = t[i]
      repeat
        if type(current) == "string" then
          i = i + 1
          return current
        elseif type(current) == "function" then
          i = i + 1
          last = current
          local ret = last()
          if ret then
            return ret
          end
        else
          i = i + 1
        end
      until i > n
  end)
  -- for i in pairs{...} do
  --   print(i)
  -- end
end

local file = assert(io.open("test.txt", "r"))
local f = multiload("print(", file:lines(), ")")
f()
