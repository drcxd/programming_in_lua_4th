local function all_substring(str)
  local l = 1
  local begin = 0
  local iter = function (s)
    repeat
      -- print(s)
      if begin + l <= string.len(s) then
        begin = begin + 1
        return string.sub(s, begin, begin + l - 1)
      elseif l <= string.len(s) then
        -- print("here")
        l = l + 1
        begin = 0
      else
        return nil
      end
    until false
  end
  return iter, str
end

local s = "aaa"
for substring in all_substring(s) do
  print(substring)
end
