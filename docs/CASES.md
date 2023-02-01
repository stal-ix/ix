IX deprecates многие разрозненные способы для сборки статически слинкованных бинарников:

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
