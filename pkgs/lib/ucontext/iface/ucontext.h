#pragma once

#include <signal.h>
#include <stddef.h>

#if defined(__cplusplus)
extern "C" {
#endif

void makecontext(ucontext_t* ucp, void (*)(), int argc, ...);
int swapcontext(ucontext_t* oucp, ucontext_t* ucp);
int getcontext(ucontext_t* ucp);
int setcontext(const ucontext_t* ucp);

#if defined(__cplusplus)
}
#endif
