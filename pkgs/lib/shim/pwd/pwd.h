#pragma once

/*
 * pwd.h for a sandbox without users: no entry, no user.
 */

struct passwd {
    char *pw_name;
    char *pw_passwd;
    unsigned pw_uid;
    unsigned pw_gid;
    char *pw_gecos;
    char *pw_dir;
    char *pw_shell;
};

static inline struct passwd *getpwnam(const char *name) {
    (void)name;
    return 0;
}

static inline struct passwd *getpwuid(unsigned uid) {
    (void)uid;
    return 0;
}

static inline unsigned getuid(void) {
    return 0;
}
