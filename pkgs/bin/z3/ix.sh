{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.12.1.tar.gz
sha:a3735fabf00e1341adcc70394993c05fd3e2ae167a3e9bb46045e33084eb64a3
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
