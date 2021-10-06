{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/gdb/gdb-11.1.tar.xz
# md5 257cb0f67927f79acf636d8c01e19990
{% endblock %}

{% block deps %}
# bld {{'lib/linux' | linux}}
# bld lib/intl lib/expat lib/ncurses lib/iconv lib/readline
# bld lib/cxx lib/z lib/xz lib/gmp lib/mpfr lib/mpc
# bld dev/build/make dev/doc/texinfo env/std
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
{% endblock %}

{% block build %}
make -j ${make_thrs} || echo > gdbserver/libinproctrace.so
make -j ${make_thrs}
{% endblock %}
