/*
 * The null WASI: every wasi_snapshot_preview1 import of wasi-libc, defined
 * inside the module. A module linked with this archive imports nothing:
 * no clock, no files, no environment, no exit. Codecs stay codecs.
 *
 * Semantics of the empty OS:
 *   - args and environment are empty (success, zero entries);
 *   - fd_write swallows the data (success), so stray warnings printed to
 *     stdout/stderr do not fail a decode;
 *   - fd_prestat_get answers EBADF, which ends the preopen scan cleanly;
 *   - proc_exit traps;
 *   - everything else answers ENOSYS.
 *
 * Prototypes follow libc-bottom-half/sources/__wasilibc_real.c of
 * wasi-libc wasi-sdk-34; i32 and i64 are spelled with compiler builtins
 * so that this file needs no headers.
 */

typedef __INT32_TYPE__ i32;
typedef __INT64_TYPE__ i64;

#define ENOSYS 52
#define EBADF 8

i32 __imported_wasi_snapshot_preview1_args_get(i32 arg0, i32 arg1) {
    (void)arg0;
    (void)arg1;
    return 0;
}

i32 __imported_wasi_snapshot_preview1_args_sizes_get(i32 arg0,
                                                         i32 arg1) {
    *(i32 *)arg0 = 0;
    *(i32 *)arg1 = 0;
    return 0;
}

i32 __imported_wasi_snapshot_preview1_environ_get(i32 arg0,
                                                      i32 arg1) {
    (void)arg0;
    (void)arg1;
    return 0;
}

i32 __imported_wasi_snapshot_preview1_environ_sizes_get(i32 arg0,
                                                            i32 arg1) {
    *(i32 *)arg0 = 0;
    *(i32 *)arg1 = 0;
    return 0;
}

i32 __imported_wasi_snapshot_preview1_clock_res_get(i32 arg0,
                                                        i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_clock_time_get(i32 arg0,
                                                         i64 arg1,
                                                         i32 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_advise(i32 arg0, i64 arg1,
                                                    i64 arg2, i32 arg3) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_allocate(i32 arg0,
                                                      i64 arg1,
                                                      i64 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_close(i32 arg0) {
    (void)arg0;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_datasync(i32 arg0) {
    (void)arg0;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_fdstat_get(i32 arg0,
                                                        i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_fdstat_set_flags(i32 arg0,
                                                              i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_fdstat_set_rights(i32 arg0,
                                                               i64 arg1,
                                                               i64 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_filestat_get(i32 arg0,
                                                          i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_filestat_set_size(i32 arg0,
                                                               i64 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_filestat_set_times(i32 arg0,
                                                                i64 arg1,
                                                                i64 arg2,
                                                                i32 arg3) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_pread(i32 arg0, i32 arg1,
                                                   i32 arg2, i64 arg3,
                                                   i32 arg4) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_prestat_get(i32 arg0,
                                                         i32 arg1) {
    (void)arg0;
    (void)arg1;
    return EBADF;
}

i32 __imported_wasi_snapshot_preview1_fd_prestat_dir_name(i32 arg0,
                                                              i32 arg1,
                                                              i32 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_pwrite(i32 arg0, i32 arg1,
                                                    i32 arg2, i64 arg3,
                                                    i32 arg4) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_read(i32 arg0, i32 arg1,
                                                  i32 arg2, i32 arg3) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_readdir(i32 arg0, i32 arg1,
                                                     i32 arg2, i64 arg3,
                                                     i32 arg4) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_renumber(i32 arg0,
                                                      i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_seek(i32 arg0, i64 arg1,
                                                  i32 arg2, i32 arg3) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_sync(i32 arg0) {
    (void)arg0;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_tell(i32 arg0, i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_fd_write(i32 arg0, i32 arg1,
                                                   i32 arg2, i32 arg3) {
    // arg1: iovec array {buf, len}, arg2: count, arg3: nwritten out
    const i32 *iov = (const i32 *)arg1;
    i32 total = 0;
    (void)arg0;
    for (i32 i = 0; i < arg2; ++i) {
        total += iov[2 * i + 1];
    }
    *(i32 *)arg3 = total;
    return 0;
}

i32 __imported_wasi_snapshot_preview1_path_create_directory(i32 arg0,
                                                                i32 arg1,
                                                                i32 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_filestat_get(i32 arg0, i32 arg1, i32 arg2, i32 arg3, i32 arg4) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_filestat_set_times(i32 arg0, i32 arg1, i32 arg2, i32 arg3, i64 arg4,
    i64 arg5, i32 arg6) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    (void)arg5;
    (void)arg6;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_link(i32 arg0, i32 arg1,
                                                    i32 arg2, i32 arg3,
                                                    i32 arg4, i32 arg5,
                                                    i32 arg6) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    (void)arg5;
    (void)arg6;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_open(i32 arg0, i32 arg1,
                                                    i32 arg2, i32 arg3,
                                                    i32 arg4, i64 arg5,
                                                    i64 arg6, i32 arg7,
                                                    i32 arg8) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    (void)arg5;
    (void)arg6;
    (void)arg7;
    (void)arg8;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_readlink(i32 arg0, i32 arg1, i32 arg2, i32 arg3, i32 arg4,
    i32 arg5) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    (void)arg5;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_remove_directory(i32 arg0,
                                                                i32 arg1,
                                                                i32 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_rename(i32 arg0, i32 arg1, i32 arg2, i32 arg3, i32 arg4,
    i32 arg5) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    (void)arg5;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_symlink(i32 arg0, i32 arg1, i32 arg2, i32 arg3, i32 arg4) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_path_unlink_file(i32 arg0,
                                                           i32 arg1,
                                                           i32 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_sched_yield(void) {
    return 0;
}

i32 __imported_wasi_snapshot_preview1_random_get(i32 arg0, i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_sock_accept(i32 arg0,
                                                      i32 arg1,
                                                      i32 arg2) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_sock_recv(i32 arg0, i32 arg1,
                                                    i32 arg2, i32 arg3,
                                                    i32 arg4, i32 arg5) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    (void)arg5;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_sock_send(i32 arg0, i32 arg1,
                                                    i32 arg2, i32 arg3,
                                                    i32 arg4) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    (void)arg4;
    return ENOSYS;
}

i32 __imported_wasi_snapshot_preview1_sock_shutdown(i32 arg0,
                                                        i32 arg1) {
    (void)arg0;
    (void)arg1;
    return ENOSYS;
}

/* the two prototypes the generator did not catch: a return type on its own
   line, and a _Noreturn */

i32 __imported_wasi_snapshot_preview1_poll_oneoff(i32 arg0, i32 arg1, i32 arg2, i32 arg3) {
    (void)arg0;
    (void)arg1;
    (void)arg2;
    (void)arg3;
    return ENOSYS;
}

__attribute__((noreturn)) void __imported_wasi_snapshot_preview1_proc_exit(i32 arg0) {
    (void)arg0;
    __builtin_trap();
}
