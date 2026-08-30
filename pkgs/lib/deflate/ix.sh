{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdeflate
{% endblock %}

{% block version %}
1.26
{% endblock %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bba03fffc5538576213675ce6968fcff6ce2e67d82e4d5febea2d05f9f13cf85
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
