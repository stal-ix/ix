{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.15.tar.gz
sha:58b95040df7383dc0413defb700d9893c194732474283cc4c8f144b00a68154b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
