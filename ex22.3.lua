local print = print -- local print is not free name now, hide global print
function foo (_ENV, a)
  print(a + b) -- print parameter a plus local _ENV.b
end
foo({b = 14}, 12) -- print 26, local _ENV defines b as 14
foo({b = 10}, 1) -- print 11
