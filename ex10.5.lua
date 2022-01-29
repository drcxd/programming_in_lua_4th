local escape

escape = function (s)
  return (string.gsub(s, ".", function (c)
                        return string.format("\\x%02X", string.byte(c))
  end))
end

local function escape_improved (s, len)
  len = len or 4
  local count = 0
  return (string.gsub(s, ".", function (c)
                        count = count + 1
                        if count == 4 then
                          count = 0
                          return string.format("\\x%02X\\z", string.byte(c))
                        end
                        return string.format("\\x%02X", string.byte(c))
  end))
end

local s = "\0\1hello\200"



print(escape(s))
print(escape_improved(s))
