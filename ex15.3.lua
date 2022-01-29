local function get_serialize(s)
  if type(s) == "string" and not string.match(s, "[%a_][%a%d_]*") then
    return string.format("[%q]", s)
  end
  return s
end
local function serialize (o, indent)
  indent = indent or 0
  local t = type(o)
  if t == "number" or t == "string" or t == "boolean" or
    t == "nil" then
    io.write(string.format("%q", o))
  elseif t == "table" then
    io.write("\n", string.rep(" ", indent), "{\n")
    indent = indent + 2
    for k,v in pairs(o) do
      io.write(string.rep(" ", indent), string.format("%s = ", get_serialize(k)))
      serialize(v, indent)
      io.write(",\n")
    end
    indent = indent - 2
    io.write(string.rep(" ", indent), "}\n")
  else
    error("cannot serialize a " .. type(o))
  end
end

local s = { x = 10, y = 20, z = 30}
local t = { ["1@#"] = 1, b = 2, c = 3, d = s}
serialize(t)
