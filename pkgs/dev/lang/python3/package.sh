# dep lib/z lib/xz lib/ffi lib/intl lib/gdbm lib/bzip2 lib/iconv
# dep lib/expat lib/sqlite3 lib/ncurses lib/openssl lib/readline
# dep lib/mpdecimal {{mix.if_linux('lib/linux')}}
# dep env/std boot/final/env
{% include 'version.sh' %}

build() {
    {% include 'build.sh' %}
}
