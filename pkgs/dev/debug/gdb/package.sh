{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
{% include 'version.sh' %}
{% endblock %}

{% block deps %}
# bld dev/debug/gdb/py(edit=readline)
# bld {{'lib/linux' | linux}} lib/intel-pt
# bld lib/intl lib/expat lib/curses/any lib/iconv lib/readline
# bld lib/cxx lib/z lib/xz lib/gmp lib/mpfr lib/mpc lib/xxhash
# bld dev/build/make dev/lang/byacc dev/lang/flex dev/doc/texinfo env/std dev/build/pkg-config
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
--with-python=$(command -v python3)
{% endblock %}

{% block test %}
echo 'python print("na gorshke" + " sidel korol")' | ${out}/bin/gdb | grep "na gorshke sidel korol"
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
