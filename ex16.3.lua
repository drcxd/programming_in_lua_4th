local function stringrep (s, n)
  local r = ""
  if n > 0 then
    while n > 1 do
      if n % 2 ~= 0 then r = r .. s
      end
      s = s .. s
      n = math.floor(n / 2)
    end
    r = r .. s
  end
  return r
end

local function build_stringrep(n)
  local t_buff = {}
  table.insert(t_buff, "local s = ...\n")
  table.insert(t_buff, "local r = \"\"\n")
  if n > 0 then
    while n > 1 do
      if n % 2 ~= 0 then
        table.insert(t_buff, "r = r .. s\n")
      end
      table.insert(t_buff, "s = s .. s\n")
      n = n // 2
    end
    table.insert(t_buff, "r = r .. s\n")
  end
  table.insert(t_buff, "return r")
  return assert(load(table.concat(t_buff)))
end

local n = 1e9 -- 1e10 overflows my 32GB memory
local s = "hello"
local f = build_stringrep(n)

local t1, t2
t1 = os.clock()
f(s)
-- print(f("hello"))
t2 = os.clock()
print("time used by the template function ", t2 - t1)

t1 = os.clock()
stringrep(s, n)
t2 = os.clock()
print("time used by the loop function ", t2 - t1)
