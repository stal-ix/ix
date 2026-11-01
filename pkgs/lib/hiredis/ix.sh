{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hiredis
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/redis/hiredis/archive/refs/tags/v{{self.version().strip()}}.tar.gz
eec7ef8641d221e144a58d5ef8d733c8c75c7fd487097a233aacb4fa33981cfb
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
