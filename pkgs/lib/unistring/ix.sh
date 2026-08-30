{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunistring
{% endblock %}

{% block version %}
1.4.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-{{self.version().strip()}}.tar.xz
5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a41499c
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
