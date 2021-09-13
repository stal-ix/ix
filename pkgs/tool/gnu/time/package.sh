# url https://ftp.gnu.org/gnu/time/time-1.9.tar.gz
# md5 d2356e0fe1c0b85285d83c6b2ad51b5f
# bld dev/build/make env/std

build() {
    $untar ${src}/time* && cd time*

    dash ./configure ${COFLAGS} --prefix=${out}
    make -j ${make_thrs}
    make install
}
