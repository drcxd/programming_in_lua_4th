local function swap(t, to, from)
  local temp = t[to]
  t[to] = t[from]
  t[from] = temp
end

local function shuffle(t)
  math.randomseed(os.time())
  for i = 1, #t do
	local from = math.random(i, #t)
    swap(t, i, from)
  end
end

local t = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
shuffle(t)

for i = 1, #t do
  print(t[i])
end
