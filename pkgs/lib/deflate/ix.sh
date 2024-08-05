{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.21.tar.gz
sha:50827d312c0413fbd41b0628590cd54d9ad7ebf88360cba7c0e70027942dbd01
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
