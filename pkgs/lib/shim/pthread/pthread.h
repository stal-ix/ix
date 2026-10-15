#pragma once

/*
 * <pthread.h> for single-threaded sandboxes (wasm32-none): the libc's
 * header as it is, and then pthread_create sent to the shim, which runs
 * the thread's function on the calling thread, to completion. The libc's
 * own pthread_create, which cannot start a thread, is reached by nobody.
 * The libc defines pthread_cancel but does not declare it; here it is.
 */

#include_next <pthread.h>

#ifdef __cplusplus
extern "C" {
#endif

int ix_pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start)(void *), void *arg);
int pthread_cancel(pthread_t thread);

#ifdef __cplusplus
}
#endif

#define pthread_create ix_pthread_create
