local function complete_month_between(t1, t2)
  local T = os.date("*t", os.difftime(t2, t1))
  return (T.year - 1970) * 12 + T.month - 1
end

local t1 = os.time({year = 2021, month = 1, day = 1})
local t2 = os.time({year = 2021, month = 2, day = 1})
print(complete_month_between(t1, t2))