# url https://github.com/tpoechtrager/cctools-port/archive/236a426c1205a3bfcf0dbb2e2faf2296f0a100e5.zip
# md5 3ba3b9f5e6ebc2afe77cdafeaaeeb981
# dep lib/cxx
# dep dev/build/make env/c env/tools env/bootstrap

build() {
    $unzip $src/*.zip && cd cctools* && cd cctools

    export CPPFLAGS="-D__crashreporter_info__=__crashreporter_info_ld__ $CPPFLAGS"

    sed -e 's/__arm__/__eat_shit__/' -i configure

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-sysroot=$OSX_SDK

    make -j $make_thrs || touch ld64/src/other/ObjectDump
    make -j $make_thrs

    make install
}
