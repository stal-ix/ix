{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
{% include 'version.sh' %}
{% endblock %}

{% block deps %}
# bld dev/debug/gdb/py/package.sh(edit=readline)
# bld {{'lib/linux/package.sh' | linux}}
# bld lib/intel-pt/package.sh
# bld lib/intl/package.sh
# bld lib/expat/package.sh
# bld lib/curses/any/package.sh
# bld lib/iconv/package.sh
# bld lib/readline/package.sh
# bld lib/cxx/package.sh
# bld lib/z/package.sh
# bld lib/xz/package.sh
# bld lib/gmp/package.sh
# bld lib/mpfr/package.sh
# bld lib/mpc/package.sh
# bld lib/xxhash/package.sh
# bld dev/build/make/package.sh
# bld dev/lang/byacc/package.sh
# bld dev/lang/flex/package.sh
# bld dev/doc/texinfo/package.sh
# bld env/std/package.sh
# bld dev/build/pkg-config/package.sh
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
