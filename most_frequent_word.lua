
local n = tonumber(arg[1])
local word_count = {}

for line in io.lines() do
  for word in string.gmatch(line, "%w+") do
    word_count[word] = (word_count[word] or 0) + 1
  end
end

local words = {}
for word in pairs(word_count) do
  table.insert(words, word)
end

table.sort(words, function (l, r)
             return word_count[l] == word_count[r] and l < r or word_count[l] > word_count[r]
end)

for i = 1, n do
  print(words[i], word_count[words[i]])
end
