-- let %d = set A
-- then %D = [^%d] = A'
-- let %u = set B
-- %U = [^%u] = B'
-- [^%d%u] = (A \or B)' == A' and B'
-- [%D%U] = A' or B'

assert(not string.match("1", "[^%d%u]"))
assert(string.match("1", "[%D%U]"))
