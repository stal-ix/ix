#include "execinfo.h"

int backtrace(void**, int) {
    return 0;
}

char** backtrace_symbols(void*const*, int) {
    return 0;
}

void backtrace_symbols_fd(void*const*, int, int) {
}
