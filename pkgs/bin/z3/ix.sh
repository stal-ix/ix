{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.9.1.tar.gz
sha:ca08ba933481242507b2f8b303c3ebdf5d16b0005d397fb45018321dc639a0d7
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
