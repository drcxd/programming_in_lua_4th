#include <stdio.h>
#include <string.h>

#include "lauxlib.h"
#include "lua.h"
#include "lualib.h"

int main(int argc, char *argv[]) {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  if (luaL_dofile(L, "ex28.1.lua")) {
    fprintf(stderr, "Failed loading lua code!\n");
    return 0;
  }

  for (int i = 0; i < 10; ++i) {
    lua_getglobal(L, "f");
    lua_pushnumber(L, i);

    if (lua_pcall(L, 1, 1, 0) != LUA_OK) {
      fprintf(stderr, "error running function 'f': %s", lua_tostring(L, -1));
      lua_pop(L, 1);
      continue;
    }

    int j = lua_tointeger(L, -1);
    lua_pop(L, 1);
    for (int k = 0; k < j; ++k) {
      fprintf(stdout, "*");
    }
    fprintf(stdout, "\n");
  }
  lua_close(L);

  return 0;
}
