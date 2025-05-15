#define _XOPEN_SOURCE 700
#include <signal.h>
#include <unistd.h>

// https://ewontfix.com/14/

int main() {
    close(0);
    close(1);
    close(2);
    setsid();
    setpgid(0, 0);

    return execve("/etc/rc", (char *[]){ "rc", 0 }, (char *[]){ 0 });
}
