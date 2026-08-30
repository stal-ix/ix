{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ncurses
{% endblock %}

{% block version %}
6.6
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/ncurses/ncurses-{{self.version().strip()}}.tar.gz
355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11
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
--with-build-cc="${HOST_CC}"
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure_shell %}
bash
{% endblock %}

{% block setup_target_flags %}
export PKG_CONFIG_LIBDIR=${out}/lib/pkgconfig
{% endblock %}
