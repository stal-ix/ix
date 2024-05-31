{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v4.10.tar.gz
sha:d4927d898053bf55b26e444a51f60218683835d43aa82fcde5429712f00d9d11
{% endblock %}

{% block bld_libs %}
lib/c
lib/fmt
lib/zstd
lib/xxhash
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCUMENTATION=OFF
ENABLE_TESTING=OFF
{% endblock %}
