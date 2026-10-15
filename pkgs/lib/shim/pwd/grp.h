#pragma once

/*
 * grp.h for a sandbox without users: no group either.
 */

struct group {
    char *gr_name;
    char *gr_passwd;
    unsigned gr_gid;
    char **gr_mem;
};

static inline struct group *getgrgid(unsigned gid) {
    (void)gid;
    return 0;
}
