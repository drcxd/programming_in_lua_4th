local escape_sequences = {
  ["\\a"] = "bell",
  ["\\b"] = "back space",
  ["\\f"] = "form feed",
  ["\\n"] = "new line",
  ["\\r"] = "carriage return",
  ["\\t"] = "horizontal tab",
  ["\\v"] = "vertical tab",
  ["\\\\"] = "backslash",
  ["\\\""] = "double quote",
  ["\\'"] = "single quote",
}

for k, v in pairs(escape_sequences) do
  print(k, v)
end
