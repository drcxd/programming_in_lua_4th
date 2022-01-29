local function mkdir(name)
  os.execute(string.format("mkdir %s", name))
end

local function rmdir(name)
  os.execute(string.format("rmdir %s", name))
end

local function ls(name)
  local entries = io.popen(string.format("ls %s", name), "r")
  local all = entries:read("a")
  io.write(all)
end

mkdir("lua_test")
ls(".")
rmdir("lua_test")
