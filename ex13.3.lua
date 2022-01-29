-- return the number of set bits
local function set_bits1(n)
    local count = 0
    while n ~= 0 do
        if n & 1 ~= 0 then count = count + 1 end
        n = n >> 1
    end
    return count
end

local function is_power_of_two(n)
  return set_bits1(n) == 1
end

assert(is_power_of_two(2))
assert(not is_power_of_two(3))
