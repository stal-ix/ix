{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
# md5 9f16c976c25bb0f76b50be749cd7a3a8
{% endblock %}

{% block lib_deps %}
lib/gmp/mix.sh
lib/mpfr/mix.sh
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-mpc=${out} \${COFLAGS}"
{% endblock %}
