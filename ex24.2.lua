local function print_result(list, n)
  for i = 1, n do io.write(list[i], " ") end
  io.write("\n")
  io.flush()
end


local function helper(list, total_num, working_num, require_num)
  working_num = working_num or #list
  require_num = require_num or total_num

  if working_num == require_num or require_num == 0 then
    -- print_result(list, total_num)
    coroutine.yield(list, total_num)
    return
  end

  if require_num > working_num then
    return
  end

  -- for i = 1, working_num do
    list[1], list[require_num] = list[require_num], list[1]
    helper(list, total_num, working_num - 1, require_num - 1)
    list[1], list[require_num] = list[require_num], list[1]

    list[1], list[working_num] = list[working_num], list[1]
    helper(list, total_num, working_num - 1, require_num)
    list[1], list[working_num] = list[working_num], list[1]
  -- end

end

local function combinations(list, num)
  return coroutine.wrap(function () helper(list, num) end)
end

local list = { 1, 2, 3 }
for combination, length in combinations(list, 2) do
  print_result(combination, length)
end

-- helper(list, 3)