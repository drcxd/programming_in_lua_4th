local mt = { __mode = "k" }
local t = {}
setmetatable(t, mt)

local o = {}
t[o] = o
o = nil
collectgarbage()

for i in pairs(t) do
  print(i)
end
