local function blit(t1, t2, position)
  table.move(t2, position, #t2, #t2 + 1)
  table.move(t1, 1, #t1, position, t2)
  return t2
end

local t1 = {1, 2, 3}
local t2 = {4, 5, 6}

blit(t1, t2, 1)
assert(#t2 == 6)
for k, v in pairs(t2) do
  assert(k == v)
end
-- for i = 1, 6 do
--   assert(i == t2[i])
-- end
