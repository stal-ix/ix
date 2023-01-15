{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.12.0.tar.gz
sha:5f575f0a3950760436217da1cc1a714569b6d4f664a75bb6775876328cf0a580
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
Z3_BUILD_LIBZ3_SHARED=OFF
WARNINGS_AS_ERRORS=OFF
{% endblock %}
