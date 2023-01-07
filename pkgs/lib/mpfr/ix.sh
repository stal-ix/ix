{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpfr/mpfr-4.2.0.tar.xz
sha:06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993
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
