#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/reboot.h>

int main(int argc, char** argv) {
    int res = reboot(atoi(argv[1]));
    if (res) {
        perror("reboot");
    }
    return res;
}
