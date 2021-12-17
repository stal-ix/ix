{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz
03a31d8cbaf29d136252f8f38875ed82
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block host_libs %}
lib/c/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/m4/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-gmp=${out} --with-libgmp-prefix=${out} \${COFLAGS}"
{% endblock %}
