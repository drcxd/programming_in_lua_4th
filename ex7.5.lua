local function get_offset_of_last_line_break(file, offset)
  file:seek("set", offset)

  local c = file:read(1)

  while not c and offset >= 0 do
    offset = offset - 1
    file:seek("set", offset)
    c = file:read(1)
  end

  while c ~= "\n" and offset >= 0 do
	offset = offset - 1
    file:seek("set", offset)
    c = file:read(1)
  end

  return offset
end

if not arg[1] or not arg[2] then
  print(string.format("Usage: %s [file_name] [number_of_lines]", arg[0]))
end

local file = assert(io.open(arg[1], "r"))
local number_of_lines = tonumber(arg[2])
local size = file:seek("end")

local offset = get_offset_of_last_line_break(file, size)
local n = 0
local line
while n < number_of_lines do
  offset = get_offset_of_last_line_break(file, offset - 1)
  line = file:read("l", offset + 1)
  print(line)
  n = n + 1
end
