{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.3.tar.gz
a2736befde5fee7d2b7eb45eb281cdbe
{% endblock %}

{% block bld_tool %}
lib/z/mix.sh
shell/cli/bash/minimal/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
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

{% block autoconf_shell %}
bash
{% endblock %}

{% block setup %}
export PKG_CONFIG_LIBDIR=${out}/lib/pkg-config
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib && (for i in `ls *.a`; do q=`echo $i | tr -d 'w'`; ln -s $i $q; done)
{% endblock %}

{% block env %}
export COFLAGS="--with-curses=${out} --with-ncurses=${out} \${COFLAGS}"
{% endblock %}
