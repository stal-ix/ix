#pragma once

#include_next <sys/wait.h>

#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
