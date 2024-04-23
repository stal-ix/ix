{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v2.1.4.tar.gz
sha:ef31a7c593866a35883b2090654a8d6136a1cf06f22b577b4e1c818b1b0a8796
{% endblock %}

{% block bld_libs %}
lib/c++/headers
lib/shim/alloc
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
