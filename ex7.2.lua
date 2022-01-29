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

if output == io.stdout then
  print("Are you sure you want to write output to stdout? (Y/N)")
  local answer = io.read("l")
  if answer == "N" then
    io.write("Input the file name: ")
    local file_name = io.read("l")
    output = io.open(file_name, "w")
  end
end

sort_lines(input, output)
