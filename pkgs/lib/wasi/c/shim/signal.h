#pragma once

#include_next <signal.h>

typedef unsigned char sigset_t;

#define sigprocmask(...) 0
