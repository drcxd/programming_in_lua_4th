local solution = {}

local function check_solution(s)
  local size = #s
  for i = 1, size do
    for j = 1, i - 1 do
      if s[i] == s[j] then
        return false
      end
      if i - j == math.abs(s[i] - s[j]) then
        return false
      end
    end
  end
  return true
end

local count = 0

local function populate_solution(s)
  local size = #s
  if size == 8 then
    return
  end
  for i = 1, 8 do
    table.insert(s, i)
    if check_solution(s) then
      if #s == 8 then
        count = count + 1
      else
        populate_solution(s)
      end
    end
    table.remove(s)
  end
end

populate_solution(solution)

print(count)
