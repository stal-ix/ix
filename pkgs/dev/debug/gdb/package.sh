{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/gdb/gdb-11.1.tar.xz
# md5 257cb0f67927f79acf636d8c01e19990
{% endblock %}

{% block deps %}
# bld dev/debug/gdb/py
# bld {{'lib/linux' | linux}} lib/intel-pt
# bld lib/intl lib/expat lib/ncurses lib/iconv lib/readline
# bld lib/cxx lib/z lib/xz lib/gmp lib/mpfr lib/mpc lib/xxhash
# bld dev/build/make dev/doc/texinfo env/std dev/build/pkg-config
{% endblock %}

{% block cflags %}
export acx_cv_cc_gcc_supports_ada=no
export ac_cv_search_tgetent=no
{% endblock %}

{% block patch %}
>gdbsupport/new-op.cc
>gdb/stub-termcap.c
{% endblock %}

{% block coflags %}
--enable-tui
--with-curses
--with-system-zlib
--with-system-readline
--disable-inprocess-agent
--with-intel-pt=yes
--with-xxhash=yes
--with-lzma=yes
--with-expat=yes
--with-mpfr=yes
--with-python=$(which python3)
{% endblock %}
