{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://www.mpfr.org/mpfr-current/mpfr-4.1.0.tar.xz
# md5 bdd3d5efba9c17da8d83a35ec552baef
{% endblock %}

{% block deps %}
# lib lib/gmp/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-mpfr=${out} --with-libmpfr-prefix=${out} \${COFLAGS}"
{% endblock %}
