local function print_all_elements(array)
  for _, value in pairs(array) do
    print(value)
  end
end

local t = {"Monday", "Tuesday", "Wednesday"}

print_all_elements(t)
