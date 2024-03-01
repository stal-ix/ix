#include <string.h>

char* __gnu_basename(const char* s) {
    const char* p = strrchr(s, '/');
    return p ? p + 1 : s;
}
