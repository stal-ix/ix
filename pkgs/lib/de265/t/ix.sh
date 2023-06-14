{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v1.0.12.tar.gz
sha:c7e5443c9387ef2ee7bd3a25b4cfeb1a66d038584cf0ab21a4a28db64f224584
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block cmake_flags %}
{% if not x86_64 %}
DISABLE_SSE=ON
{% endif %}
{% endblock %}
