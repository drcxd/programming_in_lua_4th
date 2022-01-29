-- local function debug_print_string(s)
--   for i = 1, #s do
--     print(string.format("%X", string.unpack("b", s, i)))
--   end
-- end

local function NewBitArray(n)
    local length = (n + 7) // 8
    return string.rep("\0", length)
end

local function SetBit(a, n, v)
    local index = (n + 7) // 8
    local bit = n - (index - 1) * 8
    local byte = string.unpack("b", a, index)
    if v then
        byte = byte | (1 << (bit - 1))
    else
        byte = byte & ~(1 << (bit - 1))
    end
    byte = string.pack("b", byte)
    local prefix = string.sub(a, 1, index - 1)
    local suffix = string.sub(a, index + 1)
    return string.format("%s%s%s", prefix, byte, suffix)
end

local function TestBit(a, n)
    local index = (n + 7) // 8
    local byte = string.unpack("b", a, index)
    local bit = n - (index - 1) * 8
    byte = byte & (1 << (bit - 1))
    return byte ~= 0
end

local a = NewBitArray(1)
assert(not TestBit(a, 1))
a = SetBit(a, 1, true)
assert(TestBit(a, 1))

local b = NewBitArray(16)
assert(not TestBit(b, 1))
b = SetBit(b, 9, true)
assert(TestBit(b, 9))
b = SetBit(b, 9, false)
assert(not TestBit(b, 9))
