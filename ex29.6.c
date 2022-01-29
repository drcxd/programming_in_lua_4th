#include <stdio.h>

#include "lua.h"
#include "lauxlib.h"

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

static int l_pack(lua_State *L) {
  int n = lua_gettop(L);
  int i = 1;
  lua_createtable(L, n, 0);
  lua_insert(L, 1);

  while (n > 0) {
    --n;
    lua_seti(L, 1, i++);
  }
  return 1;
}

static int l_reverse(lua_State* L) {
  int n = lua_gettop(L);
  lua_pushnil(L);
  for (int i = 1; i <= n / 2; ++i) {
    lua_copy(L, i, n + 1);
    lua_copy(L, n + 1 - i, i);
    lua_copy(L, n + 1, n + 1 - i);
  }
  lua_pop(L, 1);
  return n;
}

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

static int finish_foreach(lua_State *L, int status, intptr_t ctx) {
  printf("Entering continuation function...\n");
  if (status != LUA_YIELD) {
    /* error */
    printf("C ERROR 1\n");
    return 0;
  }
  lua_pop(L, 1);
  while (lua_next(L, 1)) {
    lua_pushvalue(L, 2); /* f */
    lua_pushvalue(L, 3); /* key */
    lua_pushvalue(L, 4); /* value */
    status = lua_pcallk(L, 2, 0, 0, 0, finish_foreach);
    if (status != LUA_OK && status != LUA_YIELD) {
      /* error */
      printf("C ERROR 2\n");
      return 1;
    }
    lua_pop(L, 1); /* pop value */
  }
  printf("C DONE\n");
  return 0;
}

static int l_foreach_can_yield(lua_State *L) {
  int status;
  lua_pushnil(L);
  while (lua_next(L, 1)) {
    lua_pushvalue(L, 2); /* f */
    lua_pushvalue(L, 3); /* key */
    lua_pushvalue(L, 4); /* value */
    status = lua_pcallk(L, 2, 0, 0, 0, finish_foreach);
    if (status != LUA_OK && status != LUA_YIELD) {
      /* error */
      printf(luaL_checkstring(L, -1));
      printf("\nC ERROR 3\n");
      return 1;
    }
    lua_pop(L, 1); /* pop value */
  }
  return 0;
}

static const struct luaL_Reg mylib[] = {
  {"summation", l_summation},
  {"pack", l_pack},
  {"reverse", l_reverse},
  {"foreach", l_foreach},
  {"foreach_can_yield", l_foreach_can_yield},
  {NULL, NULL}
};

int luaopen_mylib(lua_State *L) {
  luaL_newlib(L, mylib);
  return 1;
}
