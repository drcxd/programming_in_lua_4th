local function is_palindrome(str)
  local new_str = string.gsub(str, "[%s%p]", "")
  return new_str == string.reverse(new_str)
end

assert(is_palindrome("ab .ba"))
