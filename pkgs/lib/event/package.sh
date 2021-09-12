# url https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
# md5 b5333f021f880fe76490d8a799cd79f4
# lib lib/openssl
# bld dev/build/pkg-config dev/build/make dev/lang/python3 env/std

build() {
    $untar $src/libevent* && cd libevent*

    ln -s $(which python3) python
    setup_compiler

    dash ./configure $COFLAGS --prefix="$out"

    make -j $make_thrs
    make install

    cat << EOF > $out/env
export COFLAGS="--with-libevent=$out \$COFLAGS"
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -levent -levent_core -levent_extra -levent_pthreads \$LDFLAGS"
export PKG_CONFIG_PATH="$out/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
