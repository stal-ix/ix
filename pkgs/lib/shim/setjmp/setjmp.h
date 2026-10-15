#pragma once

/*
 * setjmp.h for single-shot sandboxes (wasi): setjmp() never returns twice,
 * longjmp() traps the instance. Every error path that used longjmp becomes
 * a trap; the host recreates the instance and treats the trap as a failure.
 */

typedef int jmp_buf[1];
typedef int sigjmp_buf[1];

static inline int setjmp(jmp_buf env) {
    (void)env;
    return 0;
}

static inline int _setjmp(jmp_buf env) {
    (void)env;
    return 0;
}

static inline int sigsetjmp(sigjmp_buf env, int savemask) {
    (void)env;
    (void)savemask;
    return 0;
}

__attribute__((noreturn)) static inline void longjmp(jmp_buf env, int val) {
    (void)env;
    (void)val;
    __builtin_trap();
}

__attribute__((noreturn)) static inline void _longjmp(jmp_buf env, int val) {
    (void)env;
    (void)val;
    __builtin_trap();
}

__attribute__((noreturn)) static inline void siglongjmp(sigjmp_buf env, int val) {
    (void)env;
    (void)val;
    __builtin_trap();
}
