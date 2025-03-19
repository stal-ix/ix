{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v2.1.8.tar.gz
sha:4d7e771b51ba0d3c4a5850d3f7f7f82c1b04af318e1351553f46aa3336439540
{% endblock %}

{% block bld_libs %}
lib/c++/headers
lib/shim/alloc
{% endblock %}

{% block c_rename_symbol %}
strdup
{% endblock %}

{% block cmake_flags %}
MI_USE_CXX=ON
MI_OVERRIDE=ON
MI_BUILD_STATIC=ON
MI_BUILD_SHARED=OFF
MI_BUILD_TESTS=OFF
{% endblock %}

{% block cpp_defines %}
{{super()}}
MI_STAT=0
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv mimalloc-*/* ./
rm -rf mimalloc-*
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/mimalloc-2.0 \${CPPFLAGS}"
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
