#include <string.h>
#include <stdio.h>

#include "lualib.h"
#include "lauxlib.h"
#include "lua.h"

static void stackDump (lua_State *L) {
  int i;
  int top = lua_gettop(L); /* depth of the stack */
  for (i = 1; i <= top; i++) { /* repeat for each level */
    int t = lua_type(L, i);
    switch (t) {
    case LUA_TSTRING: { /* strings */
      printf("'%s'", lua_tostring(L, i));
      break;
    }
    case LUA_TBOOLEAN: { /* Booleans */
      printf(lua_toboolean(L, i) ? "true" : "false");
      break;
    }
    case LUA_TNUMBER: { /* numbers */
      printf("%g", lua_tonumber(L, i));
      break;
    }
    default: { /* other values */
      printf("%s", lua_typename(L, t));
      break;
    }
    }
    printf(" "); /* put a separator */
  }
  printf("\n"); /* end the listing */
}

int main(int argc, char *argv[])
{
  lua_State *L = luaL_newstate();
  /* opens Lua */
  luaL_openlibs(L);
  /* opens the standard libraries */
  lua_pushnumber(L, 3.5);
  lua_pushstring(L, "hello");
  lua_pushnil(L);
  lua_rotate(L, 1, -1);
  lua_pushvalue(L, -2);
  lua_remove(L, 1);
  lua_insert(L, -2);

  stackDump(L);

  lua_close(L);

  return 0;
}
