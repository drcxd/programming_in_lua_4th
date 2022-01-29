
do
  local s2t = {}
  setmetatable(s2t, { __mode = "v" })
  local t2s = {}
  setmetatable(t2s, { __mode = "k" })

  function add_entry(k, v)
    if not s2t[k] then
      local mid = {}
      s2t[k] = mid
      t2s[mid] = v
    end
  end

  function get_entry(k)
    return t2s[s2t[k]]
  end
end

add_entry("mike", "john")
print(get_entry("mike"))

collectgarbage()

print(get_entry("mike"))
