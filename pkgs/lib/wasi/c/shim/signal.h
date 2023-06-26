#pragma once

#include_next <signal.h>

typedef int sigset_t;

#define sigprocmask(...) 0
