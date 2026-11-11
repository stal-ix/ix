{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
z3
{% endblock %}

{% block version %}
5.4.1
{% endblock %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-{{self.version().strip()}}.tar.gz
6a9196fb64e0460640beee08b8e823f0d51371bd3c4db78d161af275463846ef
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gmp/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block cmake_flags %}
Z3_USE_LIB_GMP=ON
WARNINGS_AS_ERRORS=OFF
Z3_BUILD_LIBZ3_SHARED=OFF
{% endblock %}
