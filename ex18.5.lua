local function get_combination (m, n, k) -- choose k elements from m to n
  -- inclusive
  if k == 0 then
    return {{}}
  end
  if n - m + 1 < k then
    return nil
  end
  local all = {}
  for i = m, n do
    local others = get_combination(i + 1, n, k - 1)
    if others then
      for _, s in pairs(others) do
        table.insert(s, i)
        table.insert(all, s)
      end
    end
  end
  return all
end

local function all_subset(s, f)
  local keys = {}
  for _, i in pairs(s) do
    table.insert(keys, i)
  end

  for i = 0, #keys do
    local combinations = get_combination(1, #keys, i)
    for _, c in pairs(combinations) do
      local t = {}
      for _, key_index in pairs(c) do
        table.insert(t, keys[key_index])
      end
      f(t)
    end
  end

end

local function print_set(s)
  for _, v in pairs(s) do
    io.write(v)
    io.write("\t")
  end
  io.write("\n")
end

local set = { }
table.insert(set, "ann")
table.insert(set, "bob")
table.insert(set, "charlie")
-- all_subset(set, print_set)

------------------------------------------------------------------
-- An alternative solution, or preferred
------------------------------------------------------------------

local function iterate_all_combinations(set, f)
  local n = #set
  local all_values  = {}
  for _, v in pairs(set) do
	table.insert(all_values, v)
  end

  local length = 0
  local t = {}
  local subset = {}
  repeat
    assert(#t == length)
    assert(#t == #subset)
    f(subset)
    if length == n then
      break
    end

    repeat
      if #t < 1 then
        length = length + 1
        for i = 1, length do
          table.insert(t, i)
          table.insert(subset, all_values[i])
        end
        break
      else
        if t[#t] < n then
          t[#t] = t[#t] + 1
          table.remove(subset)
          table.insert(subset, all_values[t[#t]])
          if length - #t <= n - t[#t] then
            while #t < length do
              table.insert(t, t[#t] + 1)
              table.insert(subset, all_values[t[#t]])
            end
            break
          else
            table.remove(t)
            table.remove(subset)
          end
        else
          table.remove(t)
          table.remove(subset)
        end
      end
    until false

  until false
end

iterate_all_combinations(set, print_set)
