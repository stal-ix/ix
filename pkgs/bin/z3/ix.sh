{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.13.2.tar.gz
sha:fd7dc6dd2633074f0a47670d6378b0e5c28c2c26f2b58aa23e9cd7f0bc9ba0dc
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
