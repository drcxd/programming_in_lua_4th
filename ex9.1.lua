-- At the very begining, I thought what the exercise asked was the following
-- function and the use case.

-- local integral
-- integral = function (f)
-- end
-- assert(math.abs(integral(math.cos)(math.pi / 2) - math.sin(math.pi / 2))
--        <= 1e-4)

-- However, after a little bit searching, I could not find the solution to find
-- the approximation of the indefinite integral of an arbitrary function. I can
-- only provide an approximation of the function's definite integral in a given
-- range.

local integral = function (f)
  return function (a, b, slices)
    assert(a, "the start of the range must be non nil")
    assert(b, "the end of the range must be non nil")
    slices = slices or 1e4
    local width = (b - a) / slices
    local result = 0
    for i = 1, slices do
      result = result + f(a + i * width) * width
    end
    return result
  end
end

local approximation = integral(math.cos)
print(math.sin(math.pi / 2) - math.sin(0))
print(approximation(0, math.pi / 2))
