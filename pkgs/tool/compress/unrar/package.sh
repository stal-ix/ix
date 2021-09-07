# url https://storage.yandexcloud.net/mix-cache/unrarsrc-6.0.6.tar.gz
# md5 4c89e2e5ecfe72a9d96478fb80f38c34
# dep lib/cxx dev/build/make env/std

build() {
    $untar $src/unrar* && cd unrar*

    setup_compiler
    make CXX=g++ CC=gcc -j $make_thrs -f makefile
    mkdir -p $out/bin
    install -v -m755 unrar $out/bin/
}
