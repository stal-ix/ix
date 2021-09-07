# dep lib/z lib/xz lib/ffi lib/intl lib/gdbm lib/bzip2 lib/iconv
# dep lib/expat lib/sqlite3 lib/ncurses lib/openssl lib/readline
# dep lib/mpdecimal
# dep dev/build/make boot/final/pkg-config env/std
{% include 'version.sh' %}

build() {
    {% include 'build.sh' %}
}
