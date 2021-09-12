# bld lib/z lib/xz lib/ffi lib/intl lib/gdbm lib/bzip2 lib/iconv
# bld lib/expat lib/sqlite3 lib/ncurses lib/openssl lib/readline
# bld lib/mpdecimal {{mix.if_linux('lib/linux')}}
# bld env/std boot/final/env
{% include 'version.sh' %}

build() {
    {% include 'build.sh' %}
}
