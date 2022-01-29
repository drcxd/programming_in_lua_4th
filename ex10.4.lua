local function trim (s)
  s = string.gsub(s, "^%s*(.-)%s*$", "%1")
  return s
end


local trouble_string = string.format("   a%sa  ", string.rep(" ", 100 * 1024))

local t1 = os.clock()
trim(trouble_string)
local t2 = os.clock()
print("slow takes ", t2 - t1)

local function trim_fast (s)
  s = string.gsub(s, "^%s*%S", "")
  s = string.gsub(s, "%S%s*$", "")
  return s
end

trouble_string = string.format("   a%sa  ", string.rep(" ", 100 * 1024))
t1 = os.clock()
trim_fast(trouble_string)
t2 = s.clock()

print("fast takes ", t2 - t1)
