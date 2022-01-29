
local n = tonumber(arg[1])
local file_name = arg[2]
local word_count = {}
local word_filter = {}

local file = assert(io.open(file_name))
for line in file:lines() do
  for word in string.gmatch(line, "%w+") do
	word_filter[word] = 1
  end
end

for line in io.lines() do
  for word in string.gmatch(line, "%w+") do
    if word_filter[word] then
      word_count[word] = (word_count[word] or 0) + 1
    end
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
