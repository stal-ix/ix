{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.12.2.tar.gz
sha:9f58f3710bd2094085951a75791550f547903d75fe7e2fcb373c5f03fc761b8f
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
