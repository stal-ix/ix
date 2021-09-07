# url https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz
# md5 61fba141303aeaf8d9a6931d247f2f4a
# lib lib/ncurses
# dep lib/event lib/utf8proc
# dep dev/build/make dev/lang/byacc dev/build/pkg-config env/std

build() {
    $untar $src/tmux* && cd tmux*

    rm cmd-parse.c

    dash ./configure $(echo $COFLAGS | tr ' ' '\n' | grep -v 'static' | tr '\n' ' ') \
        --enable-utf8proc \
        --prefix="$out"

    make -j $make_thrs
    make install
}
