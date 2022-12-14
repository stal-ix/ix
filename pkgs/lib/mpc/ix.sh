{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpc/mpc-1.3.0.tar.gz
sha:0e3b12181d37207230f5a7a7ddcfc22abfc5fc9c05825e1a65401a489a432a2a
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
lib/mpfr
{% endblock %}

{% block env %}
export COFLAGS="--with-mpc=${out} \${COFLAGS}"
{% endblock %}
