{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz
sha:0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
{% endblock %}

{% block bld_tool %}
bld/texinfo
bld/auto/archive
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-mpfr=${out} --with-libmpfr-prefix=${out} \${COFLAGS}"
{% endblock %}
