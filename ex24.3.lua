local cmdQueue = {}
-- queue of pending operations
local lib = {}
function lib.readline (stream, callback)
  local nextCmd = function ()
    callback(stream:read())
  end
  table.insert(cmdQueue, nextCmd)
end
function lib.writeline (stream, line, callback)
  local nextCmd = function ()
    callback(stream:write(line))
  end
  table.insert(cmdQueue, nextCmd)
end
function lib.stop ()
  table.insert(cmdQueue, "stop")
end
function lib.runloop ()
  while true do
    local nextCmd = table.remove(cmdQueue, 1)
    if nextCmd == "stop" then
      break
    else
      nextCmd()
      -- perform next operation
    end
  end
end
-- return lib

--------------------------------------------------------------------------------
local function run (code)
  local co = coroutine.wrap(function ()
      code()
      lib.stop()
      -- finish event loop when done
  end)
  co()
  -- start coroutine
  lib.runloop()
  -- start event loop
end

local put_mem = { }
local function putline (stream, line)
  local co = coroutine.running()
  -- calling coroutine
  -- local callback = (function () coroutine.resume(co) end)
  local callback = put_mem[co] or (function () coroutine.resume(co) end)
  put_mem[co] = callback
  lib.writeline(stream, line, callback)
  coroutine.yield()
end

local get_mem = { }
local function getline (stream)
  local co = coroutine.running()
  -- calling coroutine
  -- local callback = (function (l) coroutine.resume(co, l) end)
  local callback = get_mem[co] or (function (l) coroutine.resume(co, l) end)
  get_mem[co] = callback
  lib.readline(stream, callback)
  local line = coroutine.yield()
  return line
end

run(function ()
    local t = {}
    local inp = io.open("ex24.3.lua")
    local out = io.output()
    while true do
      local line = getline(inp)
      if not line then break end
      t[#t + 1] = line
    end
    for i = #t, 1, -1 do
      putline(out, t[i] .. "\n")
    end
end)
