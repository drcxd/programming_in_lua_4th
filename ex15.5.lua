-- I am too lazy to add those goodies from previous exercises

local function basicSerialize (o)
  -- assume 'o' is a number or a string
  return string.format("%q", o)
end
local function save (name, value, saved)
  saved = saved or {}
  -- initial value

  local table_name, key_name = string.match(name, "(.*)%[(.*)%]")
  if table_name and key_name and type(value) == "table" then
    io.write("[", key_name, "] = ")
  else
    io.write(name, " = ")
  end

  if type(value) == "number" or type(value) == "string" then
    io.write(basicSerialize(value), ",\n")
  elseif type(value) == "table" then
    if saved[value] then
      -- value already saved?
      io.write(saved[value], ",\n")
      -- use its previous name
    else
      saved[value] = name
      -- save name for next time
      -- io.write("{}\n")
      io.write("{\n")
      -- create a new table
      for k,v in pairs(value) do
        -- save its fields
        k = basicSerialize(k)
        -- local fname = string.format("%s[%s]", name, k)
        local fname
        if type(v) == "table" then
          fname = string.format("%s[%s]", name, k)
        else
          fname = string.format("[%s]", k)
        end
        save(fname, v, saved)
      end
      io.write("},\n")
    end
  else
    error("cannot save a " .. type(value))
  end
end
local a =
  {
    [1] = {"ann", "bob"},
    brown = "david",
  }
a[2] = a
a.z = a[1]

local b =
  {
    blue = a[1],
    something = 0,
  }

local saved = {}
save("a", a, saved)
save("b", b, saved)
-- for k,v in pairs(saved) do
--   print(k, v)
-- end
