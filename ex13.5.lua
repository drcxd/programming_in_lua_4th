-- test if the binary representation is a palindrome
-- @param n test number
-- @param s start bit index, default 1
-- @param e end bit index, default 64
-- both s and n are inclusive
local function is_binary_palindrome(n, s, e)
    s = s or 1
    e = e or 64
    local is_palindrome = true
    while s < e do
        local start_mask = 1 << (s - 1)
        local end_mask = 1 << (e - 1)
        local start_bit = n & start_mask
        local end_bit = n & end_mask
        if (start_bit ~= 0 or end_bit ~= 0) and start_bit * end_bit == 0 then
            is_palindrome = false
            break
        end
        s = s + 1
        e = e - 1
    end
    return is_palindrome
end

assert(is_binary_palindrome(1, 1, 1))
assert(is_binary_palindrome(3, 1, 2))
assert(is_binary_palindrome(0xFF, 1, 8))
assert(not is_binary_palindrome(0XF1, 1, 8))
