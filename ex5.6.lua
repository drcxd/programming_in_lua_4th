local function is_valid_sequence(t)
  local n = 0
  for _, _ in pairs(t) do
	n = n + 1
  end
  return n == #t
end

local sequence = {
  1, 2, 3, 4, 5
}

local not_a_sequence = {
  "bull", may = "5", "doll"
}

assert(is_valid_sequence(sequence))
assert(not is_valid_sequence(not_a_sequence))
