{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
z3
{% endblock %}

{% block version %}
4.15.0
{% endblock %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-{{self.version().strip()}}.tar.gz
sha:16aa2c02ff34a902a38bddc29f6f720deb1fb6c6987c45ccb782430300f5ccc5
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
