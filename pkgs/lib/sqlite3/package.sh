# url https://www.sqlite.org/2021/sqlite-autoconf-3350500.tar.gz
# md5 d1d1aba394c8e0443077dc9f1a681bb8
# bld lib/readline dev/build/make env/std

build() {
    $untar ${src}/sqlite* && cd sqlite*

    export CPPFLAGS="-DSQLITE_OMIT_LOAD_EXTENSION=1 $CPPFLAGS"

    setup_compiler

    dash ./configure $COFLAGS --prefix=${out}
    make -j ${make_thrs}
    make install

    cat << EOF > ${out}/env
export SQLITE3_ROOT="${out}"
export CPPFLAGS="-I${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -lsqlite3 \$LDFLAGS"
export COFLAGS="--with-sqlite3=${out} \$COFLAGS"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
