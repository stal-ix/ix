#include "error.h"

#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <errno.h>

unsigned int error_message_count = 0;

static void do_error(int status, int errnum, const char* format, va_list argp) {
    fflush(stdout);

    if (status) {
        if (errnum) {
            errno = errnum;
            verr(status, format, argp);
        } else {
            verrx(status, format, argp);
        }
    } else {
        if (errnum) {
            errno = errnum;
            vwarn(format, argp);
        } else {
            vwarnx(format, argp);
        }
    }

    ++error_message_count;

    fflush(stderr);
}


void error(int status, int errnum, const char* format, ...) {
    int saved_errno = errno;

    {
        va_list argp;

        va_start(argp, format);
        do_error(status, errnum, format, argp);
        va_end(argp);
    }

    errno = saved_errno;
}
