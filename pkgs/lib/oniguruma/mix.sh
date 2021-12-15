{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/kkos/oniguruma/archive/refs/tags/v6.9.7.1.tar.gz
e46bd3ba7f88460e5610035951e2e56d
{% endblock %}

{% block env %}
export COFLAGS="--with-onig=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}
