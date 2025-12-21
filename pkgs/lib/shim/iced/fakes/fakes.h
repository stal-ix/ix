#pragma once

#define gnu_get_libc_version() "musl"
#define gnu_get_libc_release() "1"
#define dlvsym(a, b, c) dlsym(a, b)
