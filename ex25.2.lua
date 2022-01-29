local function getvarvalue (name, level, isenv)
  local value
  local found = false
  level = (level or 1) + 1
  -- try local variables
  for i = 1, math.huge do
    local n, v = debug.getlocal(level, i)
    if not n then break end
    if n == name then
      value = v
      found = true
    end
  end
  if found then return "local", value end
  -- try non-local variables
  local func = debug.getinfo(level, "f").func
  for i = 1, math.huge do
    local n, v = debug.getupvalue(func, i)
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

local function setvarvalue (name, value, level, isenv)
  local found = false
  local old_value
  level = (level or 1) + 1
  -- try local variables
  for i = 1, math.huge do
    local n, v = debug.getlocal(level, i)
    if not n then break end
    if n == name then
      old_value = v
      debug.setlocal(level, i, value)
      found = true
    end
  end
  if found then return "local", old_value end
  -- try non-local variables
  local func = debug.getinfo(level, "f").func
  for i = 1, math.huge do
    local n, v = debug.getupvalue(func, i)
    if not n then break end
    if n == name then
      debug.setupvalue(func, i, value)
      old_value = v
      return "upvalue", old_value
    end
  end
  if isenv then return "noenv" end
  -- avoid loop
  -- not found; get value from the environment
  local _, env = getvarvalue("_ENV", level, true)
  if env then
    old_value = env[name]
    env[name] = value
    return "global", old_value
  else
    -- no _ENV available
    return "noenv"
  end
end

x = 100

local f = function ()
  x = 50
  print(setvarvalue("x", 200))
end

f()

print(x)
