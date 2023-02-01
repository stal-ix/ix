# Cases

> Why you should try **IX**

**IX** renders obsolete many disjointed ways to compile statically linked binaries:

https://buildroot.org/

```shell
ix# ix build --target=linux-aarch64 --for_target=linux-riscv64 bin/gcc bin/binutils
```

https://github.com/rsms/llvmbox

```shell
ix# ix build --target=linux-aarch64 bin/clang/16
```

https://www.busybox.net/downloads/binaries/

```shell
ix# ix build --target=linux-aarch64 --purec=musl/pure bin/busybox/ix
ix# ix build --target=linux-aarch64 --purec=uclibc/ng bin/busybox/ix
```

https://github.com/mjakob-gh/build-static-tmux<br>
https://github.com/maciejjo/static-tmux<br>
https://stackoverflow.com/questions/62620514/building-static-executable-tmux-on-linux

```shell
ix# ix build bin/tmux
```

https://stackoverflow.com/questions/11570188/how-to-build-git-with-static-linking<br>
https://github.com/EXALAB/git-static<br>
https://gist.github.com/mishudark/3080857

```shell
ix# ix build bin/git
```
