{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hiredis
{% endblock %}

{% block version %}
1.5.1
{% endblock %}

{% block fetch %}
https://github.com/redis/hiredis/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f5ec19151c0f4f15ca018c22b17b6f6739a672a4fc0c085b692aef69a154ebef
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
