static int finish_foreach(lua_State *L, int status, intptr_t ctx) {
  if (status != LUA_YIELD) {
    /* error */
    return 0;
  }
  lua_pop(L, 1);
  while (lua_next(L, 1)) {
    lua_pushvalue(L, 2); /* f */
    lua_pushvalue(L, 3); /* key */
    lua_pushvalue(L, 4); /* value */
    status = lua_pcallk(L, 2, 0, 0, finish_foreach);
    if (status != LUA_OK && status != LUA_YIELD) {
      /* error */
      return 1;
    }
    lua_pop(L, 1); /* pop value */
  }
  return 0;
}
static int l_foreach_can_yield(lua_State *L) {
  int status;
  lua_pushnil(L);
  while (lua_next(L, 1)) {
    lua_pushvalue(L, 2); /* f */
    lua_pushvalue(L, 3); /* key */
    lua_pushvalue(L, 4); /* value */
    status = lua_pcallk(L, 2, 0, 0, finish_foreach);
    if (status != LUA_OK && status != LUA_YIELD) {
      /* error */
      return 1;
    }
    lua_pop(L, 1); /* pop value */
  }
  return 0;
}
