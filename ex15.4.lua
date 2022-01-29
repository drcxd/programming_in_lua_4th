local function is_list(t)
  assert(type(t) == "table")
  local last
  for k, _ in pairs(t) do
    if type(k) ~= "number" then
      return false
    end

    if last and k ~= last + 1 then
      return false
    end

    last = tonumber(k)
  end
  return true
end

local function get_serialize(s)
  if type(s) == "number" then
    return string.format("[%s]", s)
  end
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

    if not is_list(o) then
      for k,v in pairs(o) do
        io.write(string.rep(" ", indent), string.format("%s = ", get_serialize(k)))
        serialize(v, indent)
        io.write(",\n")
      end
    else
      for _, v in pairs(o) do
        serialize(v, indent)
        io.write(",\n")
      end
    end

    indent = indent - 2
    io.write(string.rep(" ", indent), "}\n")
  else
    error("cannot serialize a " .. type(o))
  end
end

local q = { [1] = 1, [2] = 2, [4] = 4 }
local s = { ["1@#"] = 10, y = 20, z = 30, a = q }
local t = { 1, 2, 3, s }
serialize(t)
