static int l_pack(lua_State *L) {
  int n = lua_gettop(L);
  int i = 1;
  lua_createtable(L, n, 0);
  lua_insert(L, 1);

  while (n > 0) {
    --n;
    lua_seti(L, -1, i++);
  }
  return 1;
}
