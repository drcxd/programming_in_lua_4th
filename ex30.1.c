static int l_filter(lua_State *L) {
  int n = lua_len(L, -1);
  int j = 1;
  lua_newtable(L);
  for (int i = 1; i <= n; ++i) {
    lua_pushnil(L);
    lua_copy(L, 2, -1);
    lua_geti(L, 1, i);
    lua_call(L, 1, 1);
    char f = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (f) {
      lua_geti(L, 1, i);
      lua_seti(L, 3, j++);
    }
  }
  return 1;
}