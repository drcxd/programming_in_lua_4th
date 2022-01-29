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

local function putline (stream, line)
  local co = coroutine.running()
  -- calling coroutine
  local callback = (function () coroutine.resume(co) end)
  lib.writeline(stream, line, callback)
  coroutine.yield()
end

local function getline (stream)
  local co = coroutine.running()
  -- calling coroutine
  local callback = (function (l) coroutine.resume(co, l) end)
  lib.readline(stream, callback)
  local line = coroutine.yield()
  return line
end

local my_get_lines = function (stream)
  return function ()
    return getline(stream)
  end
end

run(function ()
    local input = io.open("ex24.4.lua")
    for line in my_get_lines(input) do
      print(line)
    end
end)
