local function is_palindrome(str)
  return str == string.reverse(str)
end

assert(is_palindrome("step on no pets"))
assert(not is_palindrome("banana"))
