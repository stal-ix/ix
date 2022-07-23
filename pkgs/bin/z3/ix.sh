{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.10.1.tar.gz
sha:a86071a03983b3512c44c2bf130adbc3320770dc0198805f6f51c43b0946e11a
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
