
local setbreakpoint
local removebreakpoint

local handles = {}

debug.sethook(function(_, linenumber)
    local t = debug.getinfo(2)

    for h in pairs(handles) do
      if t.func == h.func and linenumber == h.linenumber then
        print("break point hit")
        debug.debug()
      end
    end
end, "l")

setbreakpoint = function (func, line)
  local h = { func = func, linenumber = line }
  handles[h] = 1
  return h
end

removebreakpoint = function (handle)
  handles[handle] = nil
end

local f = function ()
  local x = 1
  local y = 2
  print(x + y)
end
local h = setbreakpoint(f, 29)
f()
removebreakpoint(h)
f()
