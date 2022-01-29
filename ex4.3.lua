local function insert(s1, position, s2)
  local prefix = string.sub(s1, 1, position - 1)
  local suffix = string.sub(s1, position)
  return prefix .. s2 .. suffix
end

assert(insert("hello world", 1, "start: ") == "start: hello world")
assert(insert("hello world", 7, "small ") == "hello small world")
