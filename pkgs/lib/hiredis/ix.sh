{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/redis/hiredis/archive/refs/tags/v1.1.0.tar.gz
sha:fe6d21741ec7f3fc9df409d921f47dfc73a4d8ff64f4ac6f1d95f951bf7f53d6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block env %}
export COFLAGS="--with-hiredis=${out} --with-libhiredis=${out} \${COFLAGS}"
{% endblock %}

{% block test %}
test -d ${out}/lib/cmake/hiredis
{% endblock %}
