{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/anrieff/libcpuid/archive/refs/tags/v0.6.3.tar.gz
sha:da570fdeb450634d84208f203487b2e00633eac505feda5845f6921e811644fc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCS=OFF
{% endblock %}
