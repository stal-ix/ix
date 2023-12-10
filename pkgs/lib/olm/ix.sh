{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.matrix.org/matrix-org/olm/-/archive/3.2.15/olm-3.2.15.tar.bz2
sha:543f14f58a5ff7187f62f28afedfeba246fd0f28fccdad259dee82215b91298d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
OLM_TESTS=OFF
{% endblock %}
