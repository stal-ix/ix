{% extends '//die/c/cmake.sh' %}

{% block version %}
4.14.1
{% endblock %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-{{self.version().strip()}}.tar.gz
sha:81a02c2c64c64d6c3df233f59186b95627990ada0c4c2fc901c9c25a7072672a
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
