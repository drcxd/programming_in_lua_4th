local function return_all_but_the_first(_, ...)
  return ...
end

local t = {"Monday", "Tuesday", "Wednesday"}

local Tuesday, Wednesday = return_all_but_the_first(table.unpack(t))
assert(Tuesday == "Tuesday")
assert(Wednesday == "Wednesday")
