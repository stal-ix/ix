#pragma once

/*
 * <time.h> for a sandbox whose libc has no time zones: the libc's header
 * as it is, and a tzset that sets nothing.
 */

#include_next <time.h>

static inline void tzset(void) {
}
