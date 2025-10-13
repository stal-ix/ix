{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunistring
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-{{self.version().strip()}}.tar.xz
67d88430892527861903788868c77802a217b0959990f7449f2976126a307763
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
