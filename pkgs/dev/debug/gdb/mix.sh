{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
{% include 'version.sh' %}
{% endblock %}

{% block bld_libs %}
dev/debug/gdb/py(edit=readline)
{% if target.os == 'linux' %}
lib/linux
{% endif %}
lib/intel/pt
lib/intl
lib/expat
lib/curses
lib/iconv
lib/readline
lib/c
lib/c++
lib/z
lib/xz
lib/gmp
lib/mpfr
lib/mpc
lib/xxhash
{% endblock %}

{% block bld_tool %}
dev/lang/byacc
dev/lang/flex
dev/doc/texinfo
{% endblock %}

{% block setup %}
export acx_cv_cc_gcc_supports_ada=no
export ac_cv_search_tgetent=no
{% endblock %}

{% block patch %}
>gdbsupport/new-op.cc
>gdb/stub-termcap.c
{% endblock %}

{% block configure_flags %}
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
