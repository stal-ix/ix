{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunistring
{% endblock %}

{% block version %}
1.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-{{self.version().strip()}}.tar.xz
sha:f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527
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

{% block patch %}
# broken on aarch64
>tests/Makefile.am
{% endblock %}

{% block env %}
export COFLAGS="--with-libunistring-prefix=${out} \${COFLAGS}"
{% endblock %}
