{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-1.1.tar.xz
sha:827c1eb9cb6e7c738b171745dac0888aa58c5924df2e59239318383de0729b98
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block autoreconf %}
sh autogen.sh --skip-gnulib
{% endblock %}

{% block c_rename_symbol %}
locale_charset
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
{% endblock %}
