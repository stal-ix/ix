#pragma once

#include_next <stdlib.h>

#if defined(__cplusplus)
extern "C" {
#endif

int on_exit(void (*function)(int, void*), void* arg);

#if defined(__cplusplus)
}
#endif
