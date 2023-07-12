{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/redis/hiredis/archive/refs/tags/v1.2.0.tar.gz
sha:82ad632d31ee05da13b537c124f819eb88e18851d9cb0c30ae0552084811588c
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
