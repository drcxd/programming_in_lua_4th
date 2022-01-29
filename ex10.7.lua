local function utf8_reverse(s)
  if not s then
    return ""
  end
  if utf8.len(s) <= 1 then
    return s
  end
  local pattern = string.format("(%s)(.*)(%s)", utf8.charpattern, utf8.charpattern)
  local first, middle, last = string.match(s, pattern)
  middle = utf8_reverse(middle)
  return string.format("%s%s%s", last, middle, first)
end

-- local s = "这是中文"
local s = "奇数个中文"
print(utf8_reverse(s))
