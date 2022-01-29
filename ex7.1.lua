#!/usr/bin/lua

local function sort_lines(input, output)
  local sorted = {}
  for line in input:lines() do
	table.insert(sorted, line)
  end
  table.sort(sorted)
  for _, v in pairs(sorted) do
	output:write(v, "\n")
  end
end

local input = arg[1] and io.open(arg[1], "r") or io.stdin
local output = arg[2] and io.open(arg[2], "w") or io.stdout

sort_lines(input, output)
