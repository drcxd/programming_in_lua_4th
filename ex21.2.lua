
local Stack = { data = {} }
Stack.__index = Stack

function Stack:new(o)
  o = o or {}
  setmetatable(o, Stack)
  return o
end

function Stack:is_empty()
  return #self.data == 0
end

function Stack:push(e)
  table.insert(self.data, e)
end

function Stack:pop(e)
  assert(not self:is_empty())
  table.remove(self.data, e)
end

function Stack:top()
  assert(not self:is_empty())
  return self.data[#self.data]
end

local StackQueue = Stack:new()
StackQueue.__index = StackQueue

function StackQueue:new(o)
  o = o or {}
  setmetatable(o, StackQueue)
  return o
end

function StackQueue:insert_bottom(e)
  table.insert(self.data, 1, e)
end

local my_queue = StackQueue:new()
assert(my_queue:is_empty())
my_queue:push(1)
my_queue:insert_bottom(2)
assert(my_queue:top() == 1)
my_queue:pop()
assert(my_queue:top() == 2)
my_queue:pop()
assert(my_queue:is_empty())
