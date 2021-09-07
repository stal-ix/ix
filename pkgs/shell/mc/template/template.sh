# url http://ftp.midnight-commander.org/mc-4.8.27.tar.xz
# md5 e51cd40a897d9aa01af251d191637ca4
# dep lib/intl lib/glib lib/iconv lib/{{self.typ()}}
# dep dev/build/make dev/build/pkg-config env/std
# run tool/compress/bsdtar tool/compress/bzip2 tool/compress/gzip
# run tool/compress/p7zip tool/compress/unrar tool/compress/unzip
# run tool/compress/xz tool/compress/zip

build() {
    $untar $src/mc* && cd mc*

    export CPPFLAGS="-Dupdate_panels=update_panels_mc -Dtilde_expand=tilde_expand_mc $CPPFLAGS"

    setup_compiler

    dash ./configure $COFLAGS \
        --prefix=$out \
        --with-screen={{self.typ()}} \
        --with-search-engine=glib

    make -j $make_thrs
    make install
}
