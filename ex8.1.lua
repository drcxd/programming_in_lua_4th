-- assume there is no elseif
local some_condition = nil

if some_condition then
  print("do some thing")
else if some_condition then
    print("do some thing")
else if some_condition then
    print("do some thing")
end
end
end

-- the elseif version
if some_condition then
  print("do some thing")
elseif some_condition then
  print("do some thing")
elseif some_condition then
  print("do some thing")
end

-- We can see the version without elseif has more end than the version with
-- elseif.
