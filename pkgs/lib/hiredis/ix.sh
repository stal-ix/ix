{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hiredis
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block fetch %}
https://github.com/redis/hiredis/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ca3180359a8b1275838a45415851f8cd5c411e27bdbf18f4823012e45507d2e4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
DISABLE_TESTS=ON
{% endblock %}

{% block env %}
export COFLAGS="--with-hiredis=${out} --with-libhiredis=${out} \${COFLAGS}"
{% endblock %}

{% block test %}
test -d ${out}/lib/cmake/hiredis
{% endblock %}
