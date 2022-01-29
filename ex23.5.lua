-- collectgarbage("setpause", 1000)
-- collectgarbage("setstepmul", 1000000)
collectgarbage("stop")

local max_memory = 0

local t = {}

local t1 = os.clock()
local K = 10000000
local D = 10000
for i = 1, K do
  t[i] = {}
  t[i - D] = nil
  max_memory = math.max(collectgarbage("count") * 1000, max_memory)
  if i % D == 0 then
    collectgarbage("collect")
  end
end
local t2 = os.clock()
t = nil
collectgarbage("collect")

print("max memory used is ", max_memory)
print("program takes ", t2 - t1, " seconds")

--[[ when pause is 0:
max memory used is 	1975951.171875
program takes 	1.709	 seconds
]]

--[[ when pause is 1000:
max memory used is 	9528294.921875
program takes 	1.663	 seconds
]]

--[[ when stepmul is 0:
max memory used is 	1976007.8125
program takes 	1.718	 seconds
]]

--[[ when stepmul is 1000000:
max memory used is 	1976132.8125
program takes 	1.711	 seconds
]]

--[[ manual garbage collection:
max memory used is 	1499819.3359375
program takes 	1.613	 seconds

  comparing with above results, the manual garbage collection solution achieves
the lowest max memory used and the shortest program execution time, whiche means
it is possible to optimize default garbage collection

]]
