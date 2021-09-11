# url https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
# md5 28b1cd4c94a74428723ed966c38cf479
{% if mix.platform.target.os == 'darwin' %}
# lib lib/iconv sys/framework/CoreFoundation
{% endif %}
# dep env/c boot/final/env

build() {
    $untar $src/gettext* && cd gettext* && cd gettext-runtime

    ln -s $(which dash) sh

    export PATH="$(pwd):$PATH"
    export CPPFLAGS="-Dlocale_charset=intl_locale_charset $CPPFLAGS"

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-included-gettext \
        --enable-relocatable \
        --disable-c++ \
        --disable-libasprintf

    make -j $make_thrs
    make install

    cat << EOF > $out/env
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lintl \$LDFLAGS"
export COFLAGS="--with-libintl-prefix=$out \$COFLAGS"
EOF
}
