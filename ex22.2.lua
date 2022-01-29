local foo -- foo is not a free name so it is not looked up in _ENV
do
  local _ENV = _ENV -- local _ENV reference to the _ENV which is equal to global
                    -- scope now
  function foo () print(X) end -- print local _ENV.X which is actually the
                               -- global X
end
X = 13 -- assign 13 to global X
_ENV = nil -- _ENV is nil now but the previous local _ENV still refernces the
           -- global scope
foo() -- print 13, the global scope X
X = 0 -- error, indexing nil
