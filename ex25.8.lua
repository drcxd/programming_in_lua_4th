local debug = require "debug"

-- maximum "steps" that can be performed
local steplimit = 1000

local count = 0 -- counter for steps

-- set of authorized functions
local validfunc = {
  [string.upper] = true,
  [string.lower] = true,
  [string.format] = true,
  [string.gmatch] = true,
  [table.insert] = true,
  [assert] = true,
  -- other authorized functions
}

local function hook (event)
  if event == "call" then
    local info = debug.getinfo(2, "fnS")
    if not validfunc[info.func] and info.source ~= "@".. arg[1] and info.name ~= "for iterator" then

      error("calling bad function: " .. (info.name or "?"))
    end
  end
  count = count + 1
  if count > steplimit then
    error("script uses too much CPU")
  end
end

-- load chunk
-- local f = assert(loadfile(arg[1], "t", {}))
local f = assert(loadfile(arg[1], "t"))
-- debug.sethook(hook, "", 100) -- set hook
debug.sethook(hook, "c") -- set hook
f() -- run chunk
