local function transfer(co)
  coroutine.yield(co)
end

local co1
local co2

co1 = coroutine.create(function ()
  for i = 1, 100 do
    io.write(i, " ")
    if i % 10 == 0 then
      transfer(co2)
    end
  end
  transfer(co2)
end)

co2 = coroutine.create(function ()
  for i = 100, 200 do
    io.write(i, " ")
    if (i % 10 == 0) then
      transfer(co1)
    end
  end
end)

local signal, next_to_run = coroutine.resume(co1)
while signal and next_to_run do
  signal, next_to_run = coroutine.resume(next_to_run)
end
print("")
