{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.20.tar.gz
sha:ed1454166ced78913ff3809870a4005b7170a6fd30767dc478a09b96847b9c2a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
