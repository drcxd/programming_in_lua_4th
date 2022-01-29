static int l_summation(lua_State *L) {
  int n = lua_gettop(L);
  int i = -1;
  double sum = 0;
  while (n > 0) {
    double m = luaL_checknumber(L, i--);
    sum += m;
    --n;
  }
  lua_pushnumber(L, sum);
  return 1;
}
