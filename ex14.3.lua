local function name2node (graph, name)
  local node = graph[name]
  if not node then
    -- node does not exist; create a new one
    node = {name = name, arcs = {}}
    graph[name] = node
  end
  return node
end

function ReadGraph ()
  local graph = {}
  for line in io.lines() do
    -- split line in two names
    local namefrom, nameto, label = string.match(line, "(%S+)%s+(%S+)%s+(%d+)")
    -- find corresponding nodes
    local from = name2node(graph, namefrom)
    local to = name2node(graph, nameto)
    -- adds 'to' to the adjacent set of 'from'
    local new_arc = { label = label, node_to = to }
    table.insert(from.arcs, new_arc)
  end
  return graph
end
