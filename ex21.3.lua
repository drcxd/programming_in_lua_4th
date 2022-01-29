local data = {}

local Stack = { }
Stack.__index = Stack

function Stack:new(o)
  o = o or {}
  setmetatable(o, Stack)
  data[o] = {}
  return o
end

function Stack:is_empty()
  return #data[self] == 0
end

function Stack:push(e)
  table.insert(data[self], e)
end

function Stack:pop(e)
  assert(not self:is_empty())
  table.remove(data[self], e)
end

function Stack:top()
  assert(not self:is_empty())
  return data[self][#data[self]]
end

local my_stack = Stack:new()

assert(my_stack:is_empty())
my_stack:push(1)
assert(not my_stack:is_empty())
assert(1 == my_stack:top())
my_stack:pop()
assert(my_stack:is_empty())
