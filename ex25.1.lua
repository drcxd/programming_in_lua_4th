
local function getvarvalue (co, name, level, isenv)
  local value
  local found = false
  -- level = (level or 1) + 1
  level = (level or 1) -- no need to plus 1 since getvarvalue is not in the same
                       -- stack with the coroutine we are probing try local
                       -- variables
  for i = 1, math.huge do
    local n, v = debug.getlocal(co, level, i)
    if not n then break end
    if n == name then
      value = v
      found = true
    end
  end
  if found then return "local", value end
  -- try non-local variables
  local func = debug.getinfo(co, level, "f").func
  for i = 1, math.huge do
    local n, v = debug.getupvalue(co, func, i)
    if not n then break end
    if n == name then return "upvalue", v end
  end
  if isenv then return "noenv" end
  -- avoid loop
  -- not found; get value from the environment
  local _, env = getvarvalue("_ENV", level, true)
  if env then
    return "global", env[name]
  else
    -- no _ENV available
    return "noenv"
  end
end

local co = coroutine.create(function ()
    local x = 10
    coroutine.yield()
end)

coroutine.resume(co)
print(getvarvalue(co, "x"))
