local function utf8_remove(str, start, length)
  -- Both start and length are counted in codepoints
  local prefix = string.sub(str, 1, utf8.offset(str, start) - 1)
  local suffix = string.sub(str, utf8.offset(str, start + length))
  return prefix .. suffix
end

assert(utf8_remove("ação", 2, 2) == "ao")
