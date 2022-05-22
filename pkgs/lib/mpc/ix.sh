{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
9f16c976c25bb0f76b50be749cd7a3a8
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
lib/mpfr
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-mpc=${out} \${COFLAGS}"
{% endblock %}
