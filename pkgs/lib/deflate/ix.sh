{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.19.tar.gz
sha:27bf62d71cd64728ff43a9feb92f2ac2f2bf748986d856133cc1e51992428c25
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
