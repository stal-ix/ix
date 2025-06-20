#include <sys/reboot.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    sync();
    sync();
    int res = reboot(IX_ACTION);
    if (res) {
        perror("reboot");
    }
    return res;
}
