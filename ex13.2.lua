-- return the necessary bits need to store number n in Lua
local function bits_need(n)
    if n == 0 then return 1 end
    local number_of_bit = 0
    while n ~= 0 do
        number_of_bit = number_of_bit + 1
        n = n >> 1
    end
    return number_of_bit
end

assert(bits_need(-1) == 64)
assert(bits_need(0) == 1)
assert(bits_need(0xFF) == 8)
assert(bits_need(0XF0) == 8)
