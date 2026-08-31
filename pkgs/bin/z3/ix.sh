{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
z3
{% endblock %}

{% block version %}
5.1.0
{% endblock %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-{{self.version().strip()}}.tar.gz
c433e1add0431c5edf1644bd9951c40588024d2d288f0e4215e5fcb6e3b4277d
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
