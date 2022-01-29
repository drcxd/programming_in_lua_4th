
local function listNew ()
  return {first = 0, last = -1}
end

local function pushFirst (list, value)
  local first = list.first - 1
  list.first = first
  list[first] = value
end

local function pushLast (list, value)
  local last = list.last + 1
  list.last = last
  list[last] = value
end

local function popFirst (list)
  local first = list.first
  if first > list.last then error("list is empty") end
  local value = list[first]
  list[first] = nil
  -- to allow garbage collection
  list.first = first + 1
  return value
end

local function popLast (list)
  local last = list.last
  if list.first > last then error("list is empty") end
  local value = list[last]
  list[last] = nil
  -- to allow garbage collection
  list.last = last - 1
  return value
end

local M =
  {
    listNew = listNew,
    pushFirst = pushFirst,
    pushLast = pushLast,
    popFirst = popFirst,
    popLast = popLast,
  }

return M
