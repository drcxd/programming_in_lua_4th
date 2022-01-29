local function day_of_week (t)
  local T = os.date("*t", t)
  return T.wday
end

print(day_of_week(os.time()))
