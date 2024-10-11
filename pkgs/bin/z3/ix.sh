{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.13.3.tar.gz
sha:f59c9cf600ea57fb64ffeffbffd0f2d2b896854f339e846f48f069d23bc14ba0
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

{% block cpp_defines %}
m_low_bound=m_lower_bound
{% endblock %}

{% block patch %}
sed -e 's|.*operator.*set.*get.*||' \
    -i src/math/lp/static_matrix.h
sed -e 's|get_value_of_column_cell|get_val|' \
    -i src/math/lp/static_matrix_def.h
{% endblock %}
