{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_9_8.tar.gz
sha:77371e8a58d22d5e03c52729844d1043e9cbf8d0005ec5112ffa4c8f509ddde8
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
CORESERVICES_LIB=
{% endblock %}
