# url https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz
# md5 db08bb384e81968957f997ec9808926e
# lib lib/iconv
# bld env/c boot/final/env

build() {
    $untar ${src}/lib* && cd lib*

    ln -s $(which dash) sh
    export PATH="$(pwd):${PATH}"
    export CPPFLAGS="-Dlocale_charset=unistring_locale_charset ${CPPFLAGS}"

    dash ./configure ${COFLAGS} --prefix=${out}
    make -j ${make_thrs}
    make install

    cat << EOF > ${out}/env
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
export LDFLAGS="-L${out}/lib -lunistring \${LDFLAGS}"
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
EOF
}
