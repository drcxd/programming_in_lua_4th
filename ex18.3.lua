local function uniquewords (filename)
  local f = assert(io.open(filename, "r"))
  local line = f:read() -- current line
  local pos = 1
  local dict = {}
  -- current position in the line
  return function ()
    -- iterator function
    while line do
      -- repeat while there are lines
      local w, e = string.match(line, "(%w+)()", pos)
      if w then
        -- found a word?
        pos = e
        -- next position is after this word
        if not dict[w] then
          dict[w] = true
          return w
        end
        -- return the word
      else
        line = f:read() -- word not found; try next line
        pos = 1
        -- restart from first position
      end
    end
    f:close()
    return nil
    -- no more lines: end of traversal
  end
end

for w in uniquewords("test.txt") do
  print(w)
end
