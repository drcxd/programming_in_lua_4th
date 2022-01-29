local obj = {x = "hi"}

setmetatable(obj, {__gc = function (o) print(o.x) end})

obj = nil

-- collectgarbage() --> hi

-- collectgarbage("stop") --> hi

-- os.exit() -- prints nothing

error("error") --> hi
