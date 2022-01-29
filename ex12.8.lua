local function system_time_zone()
  local date1 = os.date("!*t", 0)
  local date2 = os.date("*t", 0)
  return (os.time(date2) - os.time(date1)) // 3600
end

print(system_time_zone())
