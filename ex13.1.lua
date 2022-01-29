local function udiv (n, d)
  if d < 0 then
    if math.ult(n, d) then return 0
    else return 1
    end
  end
  local q = ((n >> 1) // d) << 1
  local r = (n - q * d)
  if not math.ult(r, d) then q = q + 1 end
  return q
end

local function umod(n, m)
  return n - (udiv(n, m) * m)
end

local m, n
n = 3
m = 2
assert(umod(n, m) == 1)

n = (1 << 63) + 1
m = n - 1
assert(umod(n, m) == 1)
