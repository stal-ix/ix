{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v1.0.15.tar.gz
sha:d4e55706dfc5b2c5c9702940b675ce2d3e7511025c6894eaddcdbaf0b15fd3f3
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
