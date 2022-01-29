local function compute_polynomial(coefficients, x)
  local value = 0
  local base = 1
  for _, v in ipairs(coefficients) do
	value = value + base * v
    base = base * x
  end
  return value
end

assert(compute_polynomial({1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 2) == 1023)
