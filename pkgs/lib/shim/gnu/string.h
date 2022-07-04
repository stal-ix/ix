#pragma once

#include <libgen.h>
#include_next <string.h>

#if defined(__cplusplus)
extern "C" {
#endif

#define basename ix_basename
char* basename(const char*);

#if defined(__cplusplus)
}
#endif
