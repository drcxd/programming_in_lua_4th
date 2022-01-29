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

if not arg[1] then
  print(string.format("Usage: %s [file_name]", arg[0]))
end

local file = assert(io.open(arg[1], "r"))
local size = file:seek("end")

local offset1 = get_offset_of_last_line_break(file, size)
local offset2 = get_offset_of_last_line_break(file, offset1 - 1)
-- print(offset1, offset2)

file:seek("set", offset2 + 1)
local line = file:read(offset1 - offset2)
io.write(line)
