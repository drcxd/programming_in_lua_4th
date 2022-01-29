static int l_foreach(lua_State *L) {
  lua_pushnil(L);
  while (lua_next(L, 1)) {
    lua_pushvalue(L, 2); /* f */
    lua_pushvalue(L, 3); /* key */
    lua_pushvalue(L, 4); /* value */
    if (lua_pcall(L, 2, 0, 0) != LUA_OK) {
      /* error */
      return 1;
    }
    lua_pop(L, 1); /* pop value */
  }
  return 0;
}
