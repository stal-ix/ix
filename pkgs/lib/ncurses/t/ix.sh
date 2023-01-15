{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.4.tar.gz
sha:6931283d9ac87c5073f30b6290c4c75f21632bb4fc3603ac8100812bed248159
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

{% block setup %}
export PKG_CONFIG_LIBDIR=${out}/lib/pkgconfig
{% endblock %}
