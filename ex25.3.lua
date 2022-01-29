local function getvarvalue ()
  local res = {}
  local value
  local found = false
  local level = 2
  -- try local variables
  for i = 1, math.huge do
    local n, v = debug.getlocal(level, i)
    if not n then break end
    res[n] = v
    -- print("found local", n)
  end
  -- try non-local variables
  local env
  local func = debug.getinfo(level, "f").func
  for i = 1, math.huge do
    local n, v = debug.getupvalue(func, i)
    if not n then break end
    if n == "_ENV" then env = v else res[n] = v end
    -- print("found upvalue", n)
  end

  if env then
    res.__index = env
    setmetatable(res, res)
  end

  return res
  -- if isenv then
  --   return "noenv"
  -- end
  -- -- avoid loop
  -- -- not found; get value from the environment
  -- local _, env = getvarvalue("_ENV", level, true)
  -- if env then
  --   return "global", env[name]
  -- else
  --   -- no _ENV available
  --   return "noenv"
  -- end
end

local x = 1
local y = 2


local function f ()
  local z = 3
  local m = 4
  local t = getvarvalue()
  return t
end

local t = getvarvalue()

for k, v in pairs(t) do
  print(k, v)
end

assert(t.getvarvalue == getvarvalue)
