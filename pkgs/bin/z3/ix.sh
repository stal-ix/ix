{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.11.0.tar.gz
sha:afa761ee2c00b66afcf7f77ccf3f9820f97142bba988040ba56ed876443b811c
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
