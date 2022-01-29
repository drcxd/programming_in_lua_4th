local Account = { balance = 0 }
Account.__index = Account;

function Account:Deposit(value)
  self.balance = self.balance + value;
end

function Account:WithDraw(value)
  self.balance = self.balance - value;
end

function Account:GetBalance()
  return self.balance;
end

local ProxyToAccount = {}

function Account:New(o)
  o = o or {}
  setmetatable(o, Account)
  return o
end

local AccountProxy = {}
AccountProxy.__index = AccountProxy

function AccountProxy:Deposit(value)
  ProxyToAccount[self]:Deposit(value)
end

function AccountProxy:WithDraw(value)
  ProxyToAccount[self]:WithDraw(value)
end

function AccountProxy:GetBalance()
  return ProxyToAccount[self]:GetBalance()
end

function AccountProxy:New(o)
  o = o or {}
  local new_account = Account:New()
  ProxyToAccount[o] = new_account
  setmetatable(o, AccountProxy)
  return o
end

local account_proxy = AccountProxy:New()
account_proxy:Deposit(100)
print(account_proxy:GetBalance())
account_proxy:WithDraw(50)
print(account_proxy:GetBalance())

print(Account:GetBalance())
