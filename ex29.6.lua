local mylib = require "mylib"

print("testing summation...")
print(mylib.summation(2.3, 5.4))
print(mylib.summation(2.3, 5.4, -34))
-- assert(mylib.summation({2.3, 5.4}) == 7.7)
-- assert(mylib.summation({2.3, 5.4, -34}) == -26.3)

print("testing pack...")
local t = mylib.pack("jack", 1, 3.14)
for _, v in pairs(t) do
  print(v)
end

print("testing reverse...")
print(mylib.reverse(1, "hello", 20))

print("testing foreach...")
mylib.foreach({x = 10, y = 20}, print)

print("testing foreach_can_yield...")
local print_yield = function (...)
  print(...)
  coroutine.yield()
end
local co = coroutine.wrap(function ()
    mylib.foreach_can_yield({x = 10, y = 20}, print_yield)
end)

co()
co()
