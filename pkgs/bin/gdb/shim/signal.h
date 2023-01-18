#pragma once

#include <asm/ptrace.h>
#include_next <signal.h>
#include <stdint.h>

struct user_sve_header {
    uint32_t size; /* total meaningful regset content in bytes */
    uint32_t max_size; /* maximum possible size for this thread */
    uint16_t vl; /* current vector length */
    uint16_t max_vl; /* maximum possible vector length */
    uint16_t flags;
    uint16_t __reserved;
};
