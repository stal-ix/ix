# url https://www.apache.org/dist/serf/serf-1.3.9.tar.bz2
# md5 370a6340ff20366ab088012cd13f2b57
# lib lib/z lib/apr lib/openssl lib/apr-util
# bld dev/build/scons tool/text/gnu/patch env/std

build() {
    $untar ${src}/serf* && cd serf*

    (base64 -d | patch -p1) << EOF
{% include 'p00.patch/base64' %}
EOF

    (base64 -d | patch -p1) << EOF
{% include 'p01.patch/base64' %}
EOF

    setup_compiler

    scons PREFIX=${out} \
        OPENSSL="$lib_openssl" \
        ZLIB="$lib_z" \
        APR="$lib_apr" \
        APU="$lib_apr_util"

    scons install

    cat << EOF > ${out}/env
export CPPFLAGS="-I${out}/include \$CPPFLAGS"
export LDFLAGS="-L${out}/lib -lserf-1 \$LDFLAGS"
export COFLAGS="--with-serf=${out} --with-libserf=${out} \$COFLAGS"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\$PKG_CONFIG_PATH"
EOF
}
