#include <sys/reboot.h>
#include <unistd.h>

int main() {
    sync();
    sync();
    return reboot(RB_AUTOBOOT);
}
