{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v0.6.4.tar.gz
sha:1cbb1a79bfe6c37884a538b56504fa0975e78e492aee7c265a42f654c6056cb3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
