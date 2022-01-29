function MySearcher(mod, path)
  local fname = package.searchpath(mod, path)
  if not fname then
    return nil
  end

  if string.match(fname, "so$") then
    mod = string.gsub(mod, "%-.*$", "")
    local funcname = "luaopen_" .. mod
    package.loadlib(fname, funcname)
  end

  if string.match(fname, "lua$") then
    local f = assert(io.open(fname, "r"))
    return load(f:read("a"))
  end

  return nil
end
