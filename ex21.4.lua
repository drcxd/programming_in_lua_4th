local map = {}

local AccountState = { balance = 0 }
AccountState.__index = AccountState

local AccountInterface = { }
AccountInterface.__index = AccountInterface

function AccountInterface:deposit (v)
  local state = map[self]
  state.balance = state.balance + v
end

function AccountInterface:get_balance ()
  return map[self].balance
end

function AccountInterface:withdraw (v)
  map[self].balance = map[self].balance - v
end

function AccountInterface:new (o)
  o = o or {}
  setmetatable(o, AccountState)
  local proxy = {}
  setmetatable(proxy, AccountInterface)
  map[proxy] = o
  return proxy
end

local account = AccountInterface:new()
assert(0 == account:get_balance())
account:deposit(100)
assert(100 == account:get_balance())
account:withdraw(200)
assert(-100 == account:get_balance())

--[=[

  Using the proxy representation, each object has to be represented by two
  separate parts: the interface and the state. The interface part and the state
  part has to have its own inheritance. It also requires a mapping table which
  maps the interface part to its corresponding state part.

  The good point here is that this implementation make it explicit that the
  interface and state are separate. The bad point is that it is complicated and
  verbose.

--]=]
