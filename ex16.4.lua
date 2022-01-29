-- there is no such function f that makes r false, since pcall never raise
-- errors to its out side and pcall only return false when its executing
-- function raises an error
local f
local r = pcall(pcall, f)
assert(r)
