{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-1.2.tar.xz
sha:632bd65ed74a881ca8a0309a1001c428bd1cbd5cd7ddbf8cedcd2e65f4dcdc44
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block autoreconf %}
sh autogen.sh --skip-gnulib
{% endblock %}

{% block cpp_includes %}
${PWD}/lib
{% endblock %}

{% block c_rename_symbol %}
locale_charset
{% endblock %}

{% block env %}
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
{% endblock %}
