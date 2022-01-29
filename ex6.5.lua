local function print_table(t)
  io.write("{ ")
  for _, v in pairs(t) do
	io.write(v)
    io.write(" ")
  end
  io.write("}")
  io.write("\n")
end

local function append_table(s, t)
  -- append t to s
  table.move(t, 1, #t, #s + 1, s)
end

local function choose(k, t)
  -- choose k elements from table t, returns a table contains all combinations
  -- of k elements of t, each combination is stored in a table
  local n = #t

  if k > n then
    return {}
  end

  if k == 0 then
    return { {} }
  end

  local last = t[#t]

  table.remove(t)
  local p = choose(k - 1, t)
  for _, v in pairs(p) do
	table.insert(v, last)
  end
  local q = choose(k, t)
  table.insert(t, last)

  append_table(q, p)
  return q
end

local function generate_combinations(t)
  local result = {}
  for i = 0, #t do
    local temp = choose(i, t)
    append_table(result, temp)
  end
  return result
end

local function print_all_combinations(t)
  local combinations = generate_combinations(t)
  for _, v in pairs(combinations) do
	print_table(v)
  end
end

local t = {1, 2, 3}
print_all_combinations(t)
