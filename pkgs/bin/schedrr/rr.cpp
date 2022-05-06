#include <sched.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    sched_param param = {};
    int sched = SCHED_RR;
    param.sched_priority = static_cast<int>(99);
    sched_setscheduler(atoi(argv[1]), sched, &param);
}
