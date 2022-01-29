local function compute_polynomial(coefficients, x)
  local value = 0
  for i, v in ipairs(coefficients) do
    value = value + v * x ^ (i - 1)
  end
  return value
end

assert(compute_polynomial({1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 2) == 1023)
