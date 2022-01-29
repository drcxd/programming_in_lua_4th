function StandardGaussianDistribution()
  local u1 = math.random()
  local u2 = math.random()
  local z1 = (-2 * math.log(u1)) ^ 0.5 * math.cos(2 * math.pi * u2)
  local z2 = (-2 * math.log(u2)) ^ 0.5 * math.sin(2 * math.pi * u2)
  return z1, z2
end
