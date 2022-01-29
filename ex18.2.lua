local function fromto(n, m, s)
  local args = {m, s}
  local iter = function(a, i)
    if i > a[1] then
      return nil
    end
    i = i + a[2]
    return i
  end
  return iter, args, n - s
end

local n = 1
local m = 10
local s = 2
local count = 1
for i in fromto(n, m, s) do
  assert(i == count)
  count = count + s
end
