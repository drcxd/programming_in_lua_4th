local function getvarvalue (_, name, level, isenv)
  -- print("debug", name, level)
  local value
  local found = false
  level = (level or 3) + 1
  -- try local variables
  for i = 1, math.huge do
    local n, v = debug.getlocal(level, i)
    if not n then break end
    -- print("debug >>> ", n)
    if n == name then
      value = v
      found = true
    end
  end
  if found then
    -- print("found local")
    return value
  end
  -- try non-local variables
  local func = debug.getinfo(level, "f").func
  for i = 1, math.huge do
    local n, v = debug.getupvalue(func, i)
    if not n then break end
    -- print("debug >>>", n)
    if n == name then
      -- print("found upvalue")
      return v end
  end
  if isenv then return nil end
  -- avoid loop
  -- not found; get value from the environment
  local env = getvarvalue(nil, "_ENV", level, true)
  if env then
    -- print("try global")
    return env[name]
  else
    -- no _ENV available
    return nil
  end
end

local function setvarvalue (_, name, value, level)
  local found = false
  local old_value
  level = (level or 3) + 1
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
  -- not found; get value from the environment
  local _, env = getvarvalue(_, "_ENV", level, true)
  if env then
    old_value = env[name]
    env[name] = value
    return "global", old_value
  else
    -- no _ENV available
    return "noenv"
  end
end

t = { }
t.__index = getvarvalue
t.__new_index = setvarvalue
setmetatable(t, t)

local function debug1 (_, ln)
  while true do
    io.write("line number:", ln, "\n")
    io.write("debug> ")
    io.flush()
    local line = io.read()
    if line == "cont" then break end
    line = string.format("%s;%s", "_ENV = t", line)
    assert(load(line))()
  end
end

debug.sethook(debug1, "l")

m = 1
-- n = 2

local f = function ()
  local x = 1
  local y = 2
  x = x + y
  y = m + n
end

f()
