function Disk (cx, cy, r)
  return function (x, y)
    return (x - cx)^2 + (y - cy)^2 <= r^2
  end
end

function Rect (left, right, bottom, up)
  return function (x, y)
    return left <= x and x <= right and
      bottom <= y and y <= up
  end
end

function Complement (r)
  return function (x, y)
    return not r(x, y)
  end
end

function Union (r1, r2)
  return function (x, y)
    return r1(x, y) or r2(x, y)
  end
end

function Intersection (r1, r2)
  return function (x, y)
    return r1(x, y) and r2(x, y)
  end
end

function Difference (r1, r2)
  return function (x, y)
    return r1(x, y) and not r2(x, y)
  end
end

function Translate (r, dx, dy)
  return function (x, y)
    return r(x - dx, y - dy)
  end
end

function Plot (r, M, N)
  io.write("P1\n", M, " ", N, "\n")
  -- header
  for i = 1, N do
    -- for each line
    local y = (N - i*2)/N
    for j = 1, M do
      -- for each column
      local x = (j*2 - M)/M
      io.write(r(x, y) and "1" or "0")
    end
    io.write("\n")
  end
end