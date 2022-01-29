-- The answer depends on if normalization is performed between two addition
-- If there is no normalization, then the results are the same
-- Otherwise, depends on the original date, the results may vary
local T1 = {year = 2021, month = 2, day = 28}
T1.day = T1.day + 1
T1 = os.date("*t", os.time(T1))
T1.month = T1.month + 1
local t1 = os.time(T1)

local T2 = {year = 2021, month = 2, day = 28}
T2.month = T2.month + 1
T2 = os.date("*t", os.time(T2))
T2.day = T2.day + 1
local t2 = os.time(T2)

assert(t1 ~= t2)
