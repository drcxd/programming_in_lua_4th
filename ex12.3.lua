local function number_of_seconds_since_start_of_day(t)
  local T = os.date("*t", t)
  T.hour = 0
  T.min = 0
  T.sec = 0
  return t - os.time(T)
end

print(number_of_seconds_since_start_of_day(os.time()))
