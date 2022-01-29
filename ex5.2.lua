local a = {}
a.a = a

assert(a.a.a.a == a)

-- Is any a in that sequence some how different from the others?

-- In "a.a.a.a", only the first a is a reference to a table, the others are
-- actually string "a"

-- It can also be rewritten as "a["a"]["a"]["a"]"

a.a.a.a = 3 -- <=> a["a"]["a"]["a"] = 3

-- Now a is a numerical value 3, so it is illegal to access a.a.a.a
