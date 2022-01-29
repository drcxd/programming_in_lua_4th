static int l_reverse(lua_State* L) {
  int n = lua_gettop(L);
  lua_rotate(L, 1, n - 1);
  return n;
}
