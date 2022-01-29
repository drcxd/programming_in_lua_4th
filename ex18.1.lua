local function fromto(n, m)
  local iter = function(mc, i)
    if i > mc then
      return nil
    end
    i = i + 1
    return i
  end
  return iter, m, n - 1
end

local n = 1
local m = 10
local count = 1
for i in fromto(n, m) do
  assert(i == count)
  count = count + 1
end
