{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz
# md5 03a31d8cbaf29d136252f8f38875ed82
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
dev/lang/m4/mix.sh
env/std/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-gmp=${out} --with-libgmp-prefix=${out} \${COFLAGS}"
{% endblock %}
