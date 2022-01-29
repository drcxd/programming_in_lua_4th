/*
  Write a function transliterate. This function receives a string and replaces
  each character in that string with another character, according to a table
  given as a second argument. If the table maps a to b, the function should
  replace any occurrence of a with b. If the table maps a to false, the function
  should remove occurrences of a from the resulting string.
 */
int l_transliterate(lua_State *L) {
  size_t len = 0;
  char const *s = luaL_checklstring(L, 1, &len);
  luaL_Buffer buff;
  char *p = luaL_buffinitsize(L, &buff, len);
  size_t new_len = 0;
  for (int i = 0; i < len; ++i) {
    char c = s[i];
    lua_pushlstring(L, s + i, 1);
    lua_gettable(L, 2);
    if (!lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      continue;
    }
    char const *t = lua_tostring(L, -1);
    luaL_addchar(&buff, t[0]);
    lua_pop(L, 1);
    ++new_len;
  }
  luaL_pushresultsize(&buff, new_len);
  return 1;
}