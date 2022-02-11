// stolen from https://github.com/swaywm/sway/issues/4540

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/vt.h>
#include <linux/kd.h>

int main(int argc, char** argv) {
    if (argc < 2) {
        return -1;
    }

    int fd = open(argv[1], O_RDWR);

    if (!fd) {
        return -2;
    }

    ioctl(fd, KDSKBMODE, K_XLATE);
    ioctl(fd, KDSETMODE, KD_TEXT);
    struct vt_mode mode = { 0 };
    mode.mode = VT_AUTO;
    ioctl(fd, VT_SETMODE, &mode);
}
