{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-2.38.tar.xz
sha:e316477a914f567eccc34d5d29785b8b0f5a10208d36bbacedcc39048ecfe024
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/intl
{% endblock %}

{% block bld_tool %}
bin/flex
bin/texinfo
bin/bison/3/6
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-plugins
--with-system-zlib
--disable-multilib
--enable-deterministic-archives
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
export acx_cv_cc_gcc_supports_ada=no
{% endblock %}
