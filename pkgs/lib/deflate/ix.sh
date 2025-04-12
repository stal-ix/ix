{% extends '//die/c/cmake.sh' %}

{% block version %}
1.23
{% endblock %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1ab18349b9fb0ce8a0ca4116bded725be7dcbfa709e19f6f983d99df1fb8b25f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBDEFLATE_BUILD_GZIP=OFF
LIBDEFLATE_BUILD_SHARED_LIB=OFF
{% endblock %}
