# url http://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2
# md5 ff3564fddcc2b9bd4a9c1d143aba4b4c
# dep dev/lang/cctools dev/build/make env/tools env/c env/bootstrap

build() {
    $untar $src/pv* && cd pv*

    ln -s $(which dash) sh

    export LD=ld
    export CPPFLAGS="-Dstat64=stat -Dfstat64=fstat -Dlstat64=lstat $CPPFLAGS"
    export PATH="$(pwd):$PATH"

    dash ./configure $COFLAGS --prefix="$out"
    make -j $make_thrs
    make install
}
