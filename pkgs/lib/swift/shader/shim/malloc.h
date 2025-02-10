#pragma once

#include_next <malloc.h>
#include <string.h>

#if defined(__cplusplus)
struct shim_mallinfo {
    size_t arena;     /* Non-mmapped space allocated (bytes) */
    size_t ordblks;   /* Number of free chunks */
    size_t smblks;    /* Number of free fastbin blocks */
    size_t hblks;     /* Number of mmapped regions */
    size_t hblkhd;    /* Space allocated in mmapped regions (bytes) */
    size_t usmblks;   /* See below */
    size_t fsmblks;   /* Space in freed fastbin blocks (bytes) */
    size_t uordblks;  /* Total allocated space (bytes) */
    size_t fordblks;  /* Total free space (bytes) */
    size_t keepcost;  /* Top-most, releasable space (bytes) */
};

inline struct shim_mallinfo shim_mallinfo() {
    struct shim_mallinfo res;
    memset(&res, 0, sizeof(res));
    return res;
}

#define mallinfo shim_mallinfo
#define mallinfo2 shim_mallinfo

#endif
