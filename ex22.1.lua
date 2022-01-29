local function getfield (f)
  local v = _G
  -- start with the table of globals
  for w, e in string.gmatch(f, "([%a_][%w_]*)([^%w_%.]?)") do
    if e and e ~= "" then
      -- print(e)
      error("invalid access operator")
    end
    print(w)
    v = v[w]
  end
  return v
end

t = {}
t.a = {}
t.a.b = {}
t.a.b.c = "love"

print(getfield("t!a!b.c"))
