-- defines a factorial function
local function fact (n)
  if n < 0 then
    print("no negative number is allowed")
    return
  end

  if n == 0 then
    return 1
  else
    return n * fact(n - 1)
  end
end

print("enter a number:")
local a = io.read("*n")
print(fact(a))
