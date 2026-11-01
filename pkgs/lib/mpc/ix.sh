{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpc
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/mpc/mpc-{{self.version().strip()}}.tar.xz
91204cd32f164bd3b7c992d4a6a8ce6519511aadab30f78b6982d0bf8d73e931
{% endblock %}

{% block lib_deps %}
lib/c
lib/gmp
lib/mpfr
{% endblock %}

{% block env %}
export COFLAGS="--with-mpc=${out} \${COFLAGS}"
{% endblock %}
