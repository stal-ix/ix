#pragma once

#include_next <sched.h>

#if defined(__cplusplus)
extern "C" {
#endif

#define sched_setscheduler ix_sched_setscheduler
int sched_setscheduler(pid_t pid, int policy, const struct sched_param* param);

#if defined(__cplusplus)
}
#endif
