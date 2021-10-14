{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
{% include 'version.sh' %}
{% endblock %}

{% block deps %}
# bld dev/debug/gdb/py
# bld {{'lib/linux' | linux}} lib/intel-pt
# bld lib/intl lib/expat lib/ncurses lib/iconv lib/readline
# bld lib/cxx lib/z lib/xz lib/gmp lib/mpfr lib/mpc lib/xxhash
# bld dev/build/make dev/lang/bison dev/doc/texinfo env/std dev/build/pkg-config
{% endblock %}

{% block cflags %}
export acx_cv_cc_gcc_supports_ada=no
export ac_cv_search_tgetent=no
{% endblock %}

{% block patch %}
>gdbsupport/new-op.cc
>gdb/stub-termcap.c

find . | grep \\.y | while read l; do
    touch ${l}
done

(
    echo 'realto=$3; trap "mv \$to \$realto" exit'
    cat ylwrap
) > _ && mv _ ylwrap
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

{% block test %}
echo 'python print("na gorshke" + " sidel korol")' | ${out}/bin/gdb | grep "na gorshke sidel korol"
{% endblock %}
