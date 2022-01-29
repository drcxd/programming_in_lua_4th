local sunday = "monday"
local monday = "sunday"
local t = {sunday = "monday", [sunday] = monday}
print(t.sunday, t[sunday], t[t.sunday])

-- t.sunday <=> t["sunday"] <=> "monday"
-- t[sunday] <=> t["monday"] <=> "sunday"
-- t[t.sunday] <=> t["monday"] <=> "sunday"
