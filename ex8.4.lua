local room1
local room2
local room3
local room4

-- initial room
room1 = function()
  local move = io.read()
  if move == "south" then room3()
  elseif move == "east" then room2()
  else
    print("invalid move")
    room1()
    -- stay in the same room
  end
end

room2 = function()
  local move = io.read()
  if move == "south" then room4()
  elseif move == "west" then room1()
  else
    print("invalid move")
    room2()
  end
end

room3 = function ()
  local move = io.read()
  if move == "north" then room1()
  elseif move == "east" then room4()
  else
    print("invalid move")
    room3()
  end
end

room4 = function ()
  print("Congratulations, you won!")
end

room1()
