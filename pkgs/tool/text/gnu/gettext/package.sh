# url https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
# md5 28b1cd4c94a74428723ed966c38cf479
# dep lib/iconv lib/intl lib/unistring lib/xml2 lib/textstyle
# dep dev/build/make tool/compress/minigzip env/std

build() {
    $untar $src/gettext* && cd gettext* && cd gettext-tools

    ln -s $(which dash) sh
    ln -s $(which minigzip) gzip

    export PATH="$(pwd):$PATH"

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-installed-libtextstyle

    make -j $make_thrs
    make install
}
