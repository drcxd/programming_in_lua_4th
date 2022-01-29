local function print_matrix(m)
  for i = 1, #m do
	for c, v in pairs(m[i]) do
      io.write(i, c, v)
    end
    io.write("\n")
  end
end

local function add_matrix(a, b)
  local c = {}
  for row = 1, #a do
    local new_row = {}
    for column, value in pairs(b[row]) do
      new_row[column] = (new_row[column] or 0) + value
      if new_row[column] == 0 then
        new_row[column] = nil
      end
    end
    for column, value in pairs(a[row]) do
      new_row[column] = (new_row[column] or 0) + value
      if new_row[column] == 0 then
        new_row[column] = nil
      end
    end
    c[row] = new_row
  end
  return c
end

local a = {{[1] = 1}, {[2] = 1}, {[3] = 1}}
local b = {{[1] = 2}, {[2] = 2}, {[3] = 2}}
local c = add_matrix(a, b)
print_matrix(c)

assert(c[1][1] == 3)
assert(c[2][2] == 3)
assert(c[3][3] == 3)
