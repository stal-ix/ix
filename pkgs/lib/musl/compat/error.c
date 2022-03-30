#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <err.h>

unsigned int musl_error_message_count = 0;

void musl_error(int status, int errnum, const char* format, ...) {
    va_list argp;
    int saved_errno = errno;

    fflush(stdout);

    va_start(argp, format);

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

    va_end(argp);

    fflush(stderr);

    ++musl_error_message_count;

    errno = saved_errno;
}
