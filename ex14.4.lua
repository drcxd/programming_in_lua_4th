function FindShortestPath(graph, from, to)
  assert(graph[from])
  assert(graph[to])

  local distance = {}
  local unvisited = {}

  for name in pairs(graph) do
    unvisited[name] = true
    distance[name] = math.maxinteger
  end
  distance[from] = 0

  local current = from
  while not unvisited[to] and current do
    local next = nil
    local smallest_distance = math.maxinteger
	for _, arc in pairs(graph[current].arcs) do
      local current_distance = distance[current] + arc.label
      local current_end = arc.node_to
      if unvisited[current_end] then
        if current_distance < distance[current_end] then
          distance[current_end] = current_distance
        end
      end
      if current_distance < smallest_distance then
        smallest_distance = current_distance
        next = arc.node_to
      end
    end
    unvisited[current] = nil
    current = next
  end
  return distance[to]
end
