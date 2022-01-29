local transliterate
transliterate = function (s, t)
  return (string.gsub(s, ".", function (c)
                        if t[c] == false then
                          return ""
                        elseif t[c] then
                          return t[c]
                        end
  end))
end

local t = { a = "b", c = false }
local s = "ac mike"
print(transliterate(s, t))
