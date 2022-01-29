#include <stdio.h>
#include <string.h>

#include "lauxlib.h"
#include "lua.h"
#include "lualib.h"

void set_limit(lua_State *L, int limit);

void *my_alloc(void *ud, void *ptr, size_t osize, size_t nsize);

static struct my_mem {
  int used_mem;
  int max_mem;
} my_ud = {0, 0};
static void *old_ud = NULL;
static lua_Alloc old_alloc = NULL;

int main(int argc, char *argv[]) {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  /* set_limit(L, 100); */
  set_limit(L, 0);
  lua_pushstring(L, "hello");
  lua_close(L);

  return 0;
}

void set_limit(lua_State *L, int limit) {
  old_alloc = lua_getallocf(L, &old_ud);
  lua_setallocf(L, my_alloc, &my_ud);
  my_ud.used_mem = 0;
  my_ud.max_mem = limit;
}

void *my_alloc(void *ud, void *ptr, size_t osize, size_t nsize) {
  struct my_mem *mud = ud;
  if (nsize == 0 && ptr == NULL) {
    /* do nothing */
    return NULL;
  }
    /* free memory */
  if (nsize == 0) {
    mud->used_mem -= nsize;
    return old_alloc(old_ud, ptr, osize, nsize);
  }
  /* alloc new */
  if (ptr == NULL) {
    if (mud->used_mem + nsize > mud->max_mem) {
      /* reach the limit */
      printf("reach memory limit!\n");
      return NULL;
    }
    void *r = old_alloc(old_ud, ptr, osize, nsize);
    if (r != NULL) {
      /* success */
      mud->used_mem += nsize;
      return r;
    }
    /* fail */
    return NULL;
  }

  /* realloc */
  void *r = old_alloc(old_ud, ptr, osize, nsize);
  if (mud->used_mem - osize + nsize > mud->max_mem) {
    /* reach the limit */
    printf("reach memory limit!\n");
    return NULL;
  }
  if (r != NULL) {
    /* success */
    mud->used_mem = mud->used_mem - osize + nsize;
    return r;
  }
  /* fail */
  return NULL;
}