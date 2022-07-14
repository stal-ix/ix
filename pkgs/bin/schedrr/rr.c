#include <sched.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    struct sched_param param;
    int sched = SCHED_RR;
    param.sched_priority = 99;
    sched_setscheduler(atoi(argv[1]), sched, &param);
}
