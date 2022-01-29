local function F (x)
  return {
    set = function (y) x = y end,
    get = function () return x end
  }
end
local o1 = F(10)
local o2 = F(20)
print(o1.get(), o2.get()) -- 10, 20
o2.set(100)
o1.set(300)
print(o1.get(), o2.get()) -- 300, 100
