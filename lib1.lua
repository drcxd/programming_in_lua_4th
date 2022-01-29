local function norm (x, y)
  return math.sqrt(x ^ 2 + y ^ 2)
end

local function twice (x)
  return 2.0 * x
end

print(norm(3, 4))
print(twice(4))
