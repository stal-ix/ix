{% extends '//die/c/autohell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/mpc
lib/gmp
lib/c++
lib/mpfr
lib/intl
lib/expat
lib/xxhash
lib/curses
lib/kernel
{% if x86_64 %}
lib/intel/pt
{% endif %}
lib/readline
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
bld/texinfo
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
{% if x86_64 %}
--with-intel-pt=yes
{% endif %}
--with-xxhash=yes
--with-lzma=yes
--with-expat=yes
--with-mpfr=yes
--disable-werror
{% endblock %}
