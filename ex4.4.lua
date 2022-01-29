local function utf8_insert(s1, position, s2)
  -- position is counted in codepoints
  local prefix = string.sub(s1, 1, utf8.offset(s1, position - 1))
  local suffix = string.sub(s1, utf8.offset(s1, position))
  return prefix .. s2 .. suffix
end

assert(utf8_insert("ação", 5, "!") == "ação!")
