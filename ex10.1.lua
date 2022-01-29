local split
split = function (s, delimiter)
  local t = {}
  local pattern = string.format("[^%s]+", delimiter)
  -- print(string.format("pattern is %s", pattern))
  for v in string.gmatch(s, pattern) do
    -- print(v)
	table.insert(t, v)
  end
  return t
end
local t = split("a whole new world", " ")

assert(#t == 4)
assert(t[1] == "a")
assert(t[2] == "whole")
assert(t[3] == "new")
assert(t[4] == "world")
