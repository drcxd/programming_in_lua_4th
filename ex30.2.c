static int l_split(lua_State *L) {
  size_t len = 0;
  const char *s = luaL_checklstring(L, 1, &len);
  /* subject */
  const char *sep = luaL_checkstring(L, 2);
  /* separator */
  const char *e;
  int i = 1;
  lua_newtable(L);
  /* result table */
  /* repeat for each separator */
  while ((e = memchr(s, *sep)) != NULL) {
    lua_pushlstring(L, s, e - s); /* push substring */
    lua_rawseti(L, -2, i++);
    /* insert it in table */
    s = e + 1; /* skip separator */
    len -= (e - s) + 1;
  }
  /* insert last substring */
  /* FIXME: string may contain zero */
  lua_pushlstring(L, s, len);
  lua_rawseti(L, -2, i);
  return 1;
  /* return the table */
}