{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.11.2.tar.gz
sha:e3a82431b95412408a9c994466fad7252135c8ed3f719c986cd75c8c5f234c7e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
#lib/gmp
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
#Z3_USE_LIB_GMP=ON
Z3_BUILD_LIBZ3_SHARED=OFF
{% endblock %}
