local function remove(str, start, length)
  local prefix = string.sub(str, 1, start - 1)
  local suffix = string.sub(str, start + length)
  return prefix .. suffix
end

assert(remove("hello world", 7, 4) == "hello d")
