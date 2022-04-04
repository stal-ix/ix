{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.3.tar.gz
a2736befde5fee7d2b7eb45eb281cdbe
{% endblock %}

{% block bld_tool %}
bld/bash
bld/gzip
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--without-shared
--without-debug
--without-ada
--enable-widec
--enable-pc-files
--enable-overwrite
--enable-ext-colors
--enable-termcap
--with-pkg-config
--with-termlib
--without-cxx
--without-cxx-binding
--with-pkg-config="$(which pkg-config)"
--with-pkg-config-libdir="${PKG_CONFIG_LIBDIR}"
{% endblock %}

{% block configure_shell %}
bash
{% endblock %}

{% block setup %}
export PKG_CONFIG_LIBDIR=${out}/lib/pkg-config
{% endblock %}
