# url https://src.fedoraproject.org/repo/pkgs/zip/zip30.tar.gz/7b74551e63f8ee6aab6fbc86676c0d37/zip30.tar.gz
# md5 7b74551e63f8ee6aab6fbc86676c0d37
# bld dev/build/make env/std

build() {
    $untar ${src}/zip* && cd zip*

    setup_compiler

    make -j ${make_thrs} -f unix/Makefile CC="gcc" CPP="gcc -E" CFLAGS="-I. -DUNIX" zips
    make -f unix/Makefile BINDIR="${out}/bin" MANDIR="${out}/man" install
}
