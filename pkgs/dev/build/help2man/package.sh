# url https://mirror.tochlab.net/pub/gnu/help2man/help2man-1.48.3.tar.xz
# md5 b51001b5d6c9fc929291d5ae8e6caafc
# lib dev/lang/perl5
# dep dev/build/make env/std

build() {
    $untar $src/help* && cd help*

    dash ./configure $COFLAGS --prefix=$out
    make -j $make_thrs
    make install
}
