{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.10.2.tar.gz
sha:889fd035b833775c8cd2eb4723eb011bf916a3e9bf08ce66b31c548acee7a321
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
