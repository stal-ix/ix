#include "string.h"

#undef basename

char* ix_basename(const char* s) {
    return basename(s);
}
