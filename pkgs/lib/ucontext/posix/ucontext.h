#pragma once

#include <signal.h>
#include <stddef.h>

#if defined(__cplusplus)
extern "C" {
#endif

#include <libucontext/libucontext.h>

#define ucontext_t libucontext_ucontext_t
#define getcontext libucontext_getcontext
#define setcontext libucontext_setcontext
#define swapcontext libucontext_swapcontext
#define makecontext libucontext_makecontext

#if defined(__cplusplus)
}
#endif
