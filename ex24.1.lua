local send
local receive

local function producer ()
  while true do
    local x = io.read()
    send(x)
  end
end

local function consumer (x)
  repeat
    io.write(x, "\n")
    io.flush()
    x = receive()
  until false
end

local consumer = coroutine.create(consumer)

send = function (x)
  coroutine.resume(consumer, x)
end

receive = function ()
  local x = coroutine.yield()
  return x
end

producer()
