#include <syscall.h>
#include <unistd.h>

#include "sched.h"

int sched_setscheduler(pid_t pid, int policy, const struct sched_param* param) {
    return syscall(SYS_sched_setscheduler, pid, policy | SCHED_RESET_ON_FORK, param);
}
