-- assume the data is packed so that all members align to 4
local file = assert(io.open(arg[1], "rb"))
local struct_size = 12
local sum = 0
for bytes in file:lines(struct_size) do
  local value, i
  _, i = string.unpack("!4i4", bytes, i)
  _, _, _, i = string.unpack("!4bbb", bytes, i)
  value, i = string.unpack("!4f", bytes, i)
  sum = sum + value
end
print("sum of value is ", sum)
