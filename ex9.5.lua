dofile("geometry.lua")

function Rotate(region, theta)
  -- rotate about the origin
  -- theta is in radians

  -- Using the rotation matrix
  -- | cos -sin |
  -- | sin  cos |
  return function (x, y)
    region(x * math.cos(theta) + y * math.sin(theta),
           y * math.cos(theta) - x * math.sin(theta))
  end
end
