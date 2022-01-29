local function utf8_is_palindrome(str)
  local no_space_punctuation = str.gsub(str, "[%s%p]", "")

  local codes = {}
  for i, c in utf8.codes(no_space_punctuation) do
    table[i] = c
  end

  for i = 1, #codes / 2 do
	if codes[i] ~= codes[#codes - i + 1] then
      return false
    end
  end
  return true
end

assert(utf8_is_palindrome("AçãooãçA"))
assert(utf8_is_palindrome("Ação .oãçA"))
