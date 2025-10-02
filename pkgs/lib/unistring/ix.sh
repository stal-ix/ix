{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunistring
{% endblock %}

{% block version %}
1.4
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-{{self.version().strip()}}.tar.xz
708571fce9965e805fee08b410aa8e886d391a492c387f75abb7be0e195337f5
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
