local function allwords ()
  local line = io.read()
  -- current line
  local pos = 1
  -- current position in the line
  return function ()
    -- iterator function
    while line do
      -- repeat while there are lines
      local w, e = string.match(line, "(%w+[,;.:]?)()", pos)
      if w then
        -- found a word?
        pos = e
        -- update next position
        return w
        -- return the word
      else
        line = io.read()
        -- word not found; try next line
        pos = 1
        -- restart from first position
      end
    end
    return nil
    -- no more lines: end of traversal
  end
end

local function prefix (words)
  local format_string = string.format("%s%%s", string.rep("%s ", #words - 1))
  return string.format(format_string, table.unpack(words))
end

local statetab = {}

local function insert (prefix, value)
  local list = statetab[prefix]
  if list == nil then
    statetab[prefix] = {value}
  else
    list[#list + 1] = value
  end
end

io.input("sample.txt")

local MAX_WORDS = 200
local NOWORD = "\n"
local SIZE = 4

local words = {}
for _ = 1, SIZE do
  table.insert(words, NOWORD)
end

for next_word in allwords() do
  insert(prefix(words), next_word)
  table.remove(words, 1)
  table.insert(words, next_word)
end
insert(prefix(words), NOWORD)

words = {}
for _ = 1, SIZE do
  table.insert(words, NOWORD)
end

for _ = 1, MAX_WORDS do
  local list = statetab[prefix(words)]
  local r = math.random(#list)
  local next_word = list[r]
  if next_word == NOWORD then
    return
  end
  io.write(next_word, " ")
  table.remove(words, 1)
  table.insert(words, next_word)
end
