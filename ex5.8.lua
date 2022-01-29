local function my_concat(string_list)
  local final = ""
  for _, s in pairs(string_list) do
	final = final .. s
  end
  return final
end

local t = {"hello", " ", "world"}
assert(my_concat(t) == "hello world")

for i = 1, 100000 do
  table.insert(t, "h")
end

local my = my_concat(t)
-- local lib = table.concat(t)
