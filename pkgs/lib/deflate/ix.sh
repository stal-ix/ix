{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdeflate
{% endblock %}

{% block version %}
1.24
{% endblock %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ad8d3723d0065c4723ab738be9723f2ff1cb0f1571e8bfcf0301ff9661f475e8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
