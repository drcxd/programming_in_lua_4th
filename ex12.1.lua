local function one_month_after(t)
  local T = os.date("*t", t)
  T.month = T.month + 1
  return os.time(T)
end

local t = os.time()
print(os.date("%d/%m/%Y", t))
print(os.date("%d/%m/%Y", one_month_after(t)))
