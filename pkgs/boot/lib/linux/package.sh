# url https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz
# md5 6e1728b2021ca19cc9273f080e6c44c7
# bld boot/stage/5/env

build() {
    $untar ${src}/linux* && cd linux*

    ln -s $(which dash) sh
    setup_compiler

    make mrproper
    make headers

    find usr/include -name '.*' -delete
    rm usr/include/Makefile
    cp -rv usr/include ${out}/

    cat << EOF > ${out}/env
export CPPFLAGS="-isystem ${out}/include \$CPPFLAGS"
EOF
}
