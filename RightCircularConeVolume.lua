#!/usr/bin/lua

function RightCircularConeVolume(height, angle)
  local r = math.tan(angle) * height
  return math.pi * (r ^ 2) * height / 3
end
