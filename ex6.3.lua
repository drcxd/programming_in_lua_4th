local function return_all_but_the_last(...)
  local all_args = table.pack(...)
  table.remove(all_args)
  return table.unpack(all_args)
end

local t = {"Monday", "Tuesday", "Wednesday"}
local Monday, Tuesday = return_all_but_the_last(table.unpack(t))
assert(Monday == "Monday")
assert("Tuesday" == Tuesday)
