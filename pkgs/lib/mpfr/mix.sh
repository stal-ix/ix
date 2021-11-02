{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://www.mpfr.org/mpfr-current/mpfr-4.1.0.tar.xz
# md5 bdd3d5efba9c17da8d83a35ec552baef
{% endblock %}

{% block lib_deps %}
lib/gmp/mix.sh
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-mpfr=${out} --with-libmpfr-prefix=${out} \${COFLAGS}"
{% endblock %}
