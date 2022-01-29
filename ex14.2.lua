function ListNew() return {first = 0, last = 0} end

function PushFirst(list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end

function PushLast(list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end

function PopFirst(list)
    local first = list.first
    if first == 0 then error("list is empty") end
    local value = list[first]
    list[first] = nil
    -- to allow garbage collection
    list.first = first + 1
    return value
end

function PopLast(list)
    local last = list.last
    if list.first == 0 then error("list is empty") end
    local value = list[last]
    list[last] = nil
    -- to allow garbage collection
    list.last = last - 1
    return value
end
