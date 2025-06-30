{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
z3
{% endblock %}

{% block version %}
4.15.2
{% endblock %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-{{self.version().strip()}}.tar.gz
3486bf5b35b185981cab0b0a81f870547648a1ca433085aa79afd17c44959751
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
