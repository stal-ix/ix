# url http://deb.debian.org/debian/pool/main/f/file/file_5.39.orig.tar.gz
# md5 1c450306053622803a25647d88f80f25
# bld env/c boot/final/env

build() {
    $untar ${src}/file* && cd file*

    dash ./configure ${COFLAGS} --prefix=${out}
    make -j ${make_thrs}
    make install
}
