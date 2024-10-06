{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.22.tar.gz
sha:7f343c7bf2ba46e774d8a632bf073235e1fd27723ef0a12a90f8947b7fe851d6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
