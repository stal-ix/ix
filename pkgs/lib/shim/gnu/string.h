#pragma once

#include_next <string.h>

#if defined(_GNU_SOURCE)

#if defined(__cplusplus)
extern "C" {
#endif

char* __gnu_basename(const char* s);

#define basename(x) __gnu_basename(x)

#if defined(__cplusplus)
}
#endif

#endif
