local count = 0
local mt = {__gc = function () count = count - 1 end}
local a = {}
for i = 1, 10000 do
  count = count + 1
  a[i] = setmetatable({}, mt)
end
collectgarbage()
print(collectgarbage("count") * 1024, count) -- nothing is collected, count is
                                             -- 10000
a = nil
collectgarbage()
print(collectgarbage("count") * 1024, count) -- a's keys are collected, count is
                                             -- still 0, but 10000 tables is not
                                             -- collected yet, only finalizers
                                             -- are executed 582436 bytes used
                                             -- (2)
collectgarbage()
print(collectgarbage("count") * 1024, count) -- 10000 table has already been
                                             -- collected, count is 0
