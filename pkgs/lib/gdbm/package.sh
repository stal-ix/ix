# url https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz
# md5 aeb29c6a90350a4c959cd1df38cd0a7e
# dep lib/intl lib/iconv lib/readline dev/build/make env/std

build() {
    $untar $src/gdbm* && cd gdbm*

    dash ./configure $COFLAGS \
        --prefix=$out \
        --enable-libgdbm-compat \
        --with-readline

    make -j $make_thrs
    make install

    cd $out/lib && ln -s libgdbm_compat.a libdbm.a

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lgdbm -lgdbm_compat \$LDFLAGS"
export COFLAGS="--with-gdbm=$out \$COFLAGS"
EOF
}
