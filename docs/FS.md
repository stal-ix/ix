# stal/IX Filesystem


> This document describes the **stal/IX** file system layout.


The /ix/store/ contains a folders set, each package corresponds to one folder.<br>
Folders form a content addressable store, that is, all paths uniquely identify a unique package.

```shell
pg-> ls -la /ix/store/ | head -n 10
total 340
drwxr-xr-x 5664 ix       1000        393216 Dec 11 16:46 .
drwxr-xr-x    6 ix       root            58 Nov  4 23:02 ..
drwxr-xr-x    4 ix       1000            56 Dec  7 01:17 00BoJm6qe56myzQk-lib-jxl
drwxr-xr-x    4 ix       1000            56 Dec  5 19:48 00OKaSNZ7iL7AJWm-lib-ssh-2
drwxr-xr-x    4 ix       1000            56 Dec  7 02:37 01JxssFZ9igzTy5i-lib-web-kit-gtk-orig
drwxr-xr-x    4 ix       1000            54 Dec  7 02:02 01S601SnGrScamy9-bin-xchm-unwrap
drwxr-xr-x    2 ix       1000            50 Dec  1 14:06 02P6wVvlRjp7YoRD-url-libxslt-v1-1-37-tar-bz2
drwxr-xr-x    3 ix       1000            41 Dec 11 04:10 02TsF9yb8tvNU18u-bin-p7zip-a
drwxr-xr-x    2 ix       1000            44 Dec  1 14:06 03xrH1zQOmgF5IBK-lnk
```

The /ix/realm/ folder contains pointers to folders from /ix/store/:

```shell
pg-> ls -la /ix/realm/
total 0
drwxrwxrwx    2 ix       1000            56 Dec 11 16:46 .
drwxr-xr-x    6 ix       root            58 Nov  4 23:02 ..
lrwxrwxrwx    1 pg       10000           35 Dec 11 06:08 boot -> /ix/store/8V4bablsXQcSK6ZY-rlm-boot
lrwxrwxrwx    1 pg       10000           37 Dec 11 06:08 kernel -> /ix/store/GAw71z9yAtwOStPd-rlm-kernel
lrwxrwxrwx    1 pg       10000           33 Dec 11 16:46 pg -> /ix/store/w5qTNK0MpREVL4Cy-rlm-pg
lrwxrwxrwx    1 pg       10000           37 Dec 11 06:08 system -> /ix/store/oQfJCY3xa3jlPkNf-rlm-system
```

Actually, these are "roots" by which the **IX** package manager can understand what is actively used in /ix/store/ and what can be safely removed using the `ix gc` command.

Some realms are predefined:

/ix/realm/system - the "system" realm, it contains code needed to boot the OS.

Root folders /etc, /bin look at the system realm:

```shell
pg-> ls -la /bin /etc
lrwxrwxrwx    1 root     root            20 May 22  2022 /bin -> /ix/realm/system/bin
lrwxrwxrwx    1 root     root            20 May 22  2022 /etc -> /ix/realm/system/etc
```

By the way, this is why there's no point in editing files in /etc, they'll be updated with any update of /ix/realm/system.

For every user in the system with name USER, there is a realm /ix/realm/USER, that belongs to that user:

* it's default when using ix mut: `ix mut bin/nano` will install nano in your personal realm.
* it comes first in PATH:

```shell
pg-> echo ${PATH}
/ix/realm/pg/bin:/bin
```

To make it work, your session manager must do `. /etc/session`
