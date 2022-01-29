local new_poly
new_poly = function (coefficients)
  return function (x)
    local sum = 0
    for p, c in pairs(coefficients) do
      sum = sum + c * x ^ (p - 1)
    end
    return sum
  end
end

local f = new_poly({3, 0, 1})
assert(f(0) == 3)
assert(f(5) == 28)
assert(f(10) == 103)
