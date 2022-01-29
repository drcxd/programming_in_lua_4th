local proxy_to_table = {}
local mt = {
  __index = function (t, k)
    return proxy_to_table[t][k]
  end,
  __newindex = function()
    error("You are doomed!", 2)
  end
}
local function readOnly (t)
  local proxy = {}
  proxy_to_table[proxy] = t
  setmetatable(proxy, mt)
  return proxy
end

local t = { "this", "that" }
t = readOnly(t)
-- print(getmetatable(t))
print (t[1])
t[1] = "kk"
