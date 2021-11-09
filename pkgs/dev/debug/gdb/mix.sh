{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
{% include 'version.sh' %}
{% endblock %}

{% block bld_deps %}
dev/debug/gdb/py/mix.sh(edit=readline)
{{'lib/linux/mix.sh' | linux}}
lib/intel-pt/mix.sh
lib/intl/mix.sh
lib/expat/mix.sh
lib/curses/any/mix.sh
lib/iconv/mix.sh
lib/readline/mix.sh
lib/c++/mix.sh
lib/z/mix.sh
lib/xz/mix.sh
lib/gmp/mix.sh
lib/mpfr/mix.sh
lib/mpc/mix.sh
lib/xxhash/mix.sh
dev/lang/byacc/mix.sh
dev/lang/flex/mix.sh
dev/doc/texinfo/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block setup %}
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
