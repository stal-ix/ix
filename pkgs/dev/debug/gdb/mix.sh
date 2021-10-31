{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
{% include 'version.sh' %}
{% endblock %}

{% block deps %}
# bld dev/debug/gdb/py/mix.sh(edit=readline)
# bld {{'lib/linux/mix.sh' | linux}}
# bld lib/intel-pt/mix.sh
# bld lib/intl/mix.sh
# bld lib/expat/mix.sh
# bld lib/curses/any/mix.sh
# bld lib/iconv/mix.sh
# bld lib/readline/mix.sh
# bld lib/cxx/mix.sh
# bld lib/z/mix.sh
# bld lib/xz/mix.sh
# bld lib/gmp/mix.sh
# bld lib/mpfr/mix.sh
# bld lib/mpc/mix.sh
# bld lib/xxhash/mix.sh
# bld dev/build/make/mix.sh
# bld dev/lang/byacc/mix.sh
# bld dev/lang/flex/mix.sh
# bld dev/doc/texinfo/mix.sh
# bld env/std/mix.sh
# bld dev/build/pkg-config/mix.sh
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
