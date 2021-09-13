# url https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz
# md5 691b1221694c3394f1c537df4eee39d3
# bld env/std

build() {
    $untar ${src}/gzip* && cd gzip*

    dash ./configure $COFLAGS --prefix=${out} --disable-gcc-warnings
    make -j ${make_thrs}
    make install
}
