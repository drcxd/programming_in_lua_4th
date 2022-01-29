local function utf8_transliterate (s, t)
  return (string.gsub(s, utf8.charpattern, function (c)
                        if t[c] == false then
                          return ""
                        elseif t[c] then
                          return t[c]
                        end
  end))
end

local t = { a = "b", c = false, ["米"] = "面" }
local s = "ac mike 米"
print(utf8_transliterate(s, t))
