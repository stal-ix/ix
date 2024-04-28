{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.5.tar.gz
sha:136d91bc269a9a5785e5f9e980bc76ab57428f604ce3e5a5a90cebc767971cc6
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
