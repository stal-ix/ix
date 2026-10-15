/*
 * pthread_create for a single-threaded sandbox: runs the thread's function
 * on the calling thread, to completion, and reports success. A decoder
 * that starts a thread per job and then waits for it, with all of its
 * data already in memory, finds the job done when create returns. The
 * target's libc keeps the rest of the API as its own single-threaded
 * stubs; its own pthread_create, which cannot start a thread, is left
 * alone and reached by nobody: pthread_sync.h renames the calls to this.
 */

#include <pthread.h>

int ix_pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start)(void *), void *arg) {
    (void)attr;
    *thread = pthread_self();
    start(arg);
    return 0;
}
