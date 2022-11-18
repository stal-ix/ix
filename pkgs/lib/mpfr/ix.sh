{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.1.tar.xz
sha:ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d
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

{% block setup %}
export CPPFLAGS="-include stdint.h ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-mpfr=${out} --with-libmpfr-prefix=${out} \${COFLAGS}"
{% endblock %}
