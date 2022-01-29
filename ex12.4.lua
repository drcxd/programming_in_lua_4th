local function get_first_Friday(year)
  local T = {year = year, month = 1, day = 1}
  T = os.date("*t", os.time(T))
  while T.wday ~= 6 do
    T.day = T.day + 1
    T = os.date("*t", os.time(T))
  end
  return os.date("%d/%m/%Y", os.time(T))
end

print(get_first_Friday(2021))
