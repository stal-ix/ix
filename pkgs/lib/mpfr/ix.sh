{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpfr
{% endblock %}

{% block version %}
4.2.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpfr/mpfr-{{self.version().strip()}}.tar.xz
b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
{% endblock %}

{% block bld_tool %}
bld/texinfo
bld/auto/archive
{% endblock %}

{% block configure_flags %}
--enable-thread-safe
--enable-formally-proven-code
{% endblock %}

{% block cpp_missing %}
stdint.h
{% endblock %}

{% block env %}
export COFLAGS="--with-mpfr=${out} --with-libmpfr-prefix=${out} \${COFLAGS}"
{% endblock %}
