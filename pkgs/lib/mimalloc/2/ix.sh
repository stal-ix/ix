{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v2.0.9.tar.gz
sha:4a29edae32a914a706715e2ac8e7e4109e25353212edeed0888f4e3e15db5850
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
{% endblock %}
