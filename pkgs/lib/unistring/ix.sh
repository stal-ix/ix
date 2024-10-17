{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.xz
sha:f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527
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
