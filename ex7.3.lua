local function copy_stdin_to_stdout(type)
  if type == "b" then
    local c = io.read(1)
    while c do
      io.write(c)
      c = io.read(1)
    end
  elseif type == "l" then
    local l = io.read("l")
    while l do
      io.write(l)
      l = io.read("l")
    end
  elseif type == "c" then
    local c = io.read(8 * 1024)
    while c do
      io.write(c)
      c = io.read(8 * 1024)
    end
  elseif type == "f" then
    -- input file should be no more than 1MB
    local f = io.read("a")
    io.write(f)
  else
    print("invalid option")
  end
end

copy_stdin_to_stdout(arg[1])
