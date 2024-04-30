{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v0.6.5.tar.gz
sha:4d106d66d211f2bfaf876eb62c84d4b54664e1c2b47eb6138161d3c608c0bc5e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
