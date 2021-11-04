{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/kkos/oniguruma/releases/download/v6.9.7.1/onig-6.9.7.1.tar.gz
d39409a103dcd44425e37b88d642f22c
{% endblock %}

{% block bld_deps %}
dev/build/cmake/mix.sh
env/std/mix.sh
{% endblock %}

{% block env %}
export COFLAGS="--with-onig=${out} \${COFLAGS}"
{% endblock %}
