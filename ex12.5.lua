local function complete_days_between(t1, t2)
  return os.difftime(t2, t1) // (24 * 3600)
end

local T1 = {year = 2021, month = 1, day = 1}
local T2 = {year = 2021, month = 1, day = 2}
print(complete_days_between(os.time(T1), os.time(T2)))
