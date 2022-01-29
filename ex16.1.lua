local function loadwithprefix(prefix, codeorfunction)
  if type(codeorfunction) == "string" then
    local code_table = {prefix, codeorfunction}
    local i = 0
    return load(function ()
        i = i + 1
        return code_table[i]
    end)
  elseif type(codeorfunction) == "function" then
    local prefix_loaded = false
    return load(function ()
        if prefix_loaded then
          return codeorfunction()
        else
          prefix_loaded = true
          return prefix
        end
    end)
  end
end

-- local input = assert(io.open("test.txt", "r"))
-- local f = assert(loadwithprefix("return ", input:lines()))
local f = assert(loadwithprefix("return ", "3 + 5"))
print(f())
