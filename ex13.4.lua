local function set_bits1(n)
    local count = 0
    while n ~= 0 do
        if n & 1 ~= 0 then count = count + 1 end
        n = n >> 1
    end
    return count
end

local function hamming_weight(n)
  return set_bits1(n)
end

assert(hamming_weight(1) == 1)
assert(hamming_weight(2) == 1)
assert(hamming_weight(0xFF) == 8)
