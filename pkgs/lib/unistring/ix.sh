{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunistring
{% endblock %}

{% block version %}
1.5
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libunistring/libunistring-{{self.version().strip()}}.tar.xz
fe89007a8a414ae4790b816b86859e877d3ab135db3c37f06541ff7e85ac344b
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
