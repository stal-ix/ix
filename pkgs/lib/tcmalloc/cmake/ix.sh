{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-2.10.tar.gz
sha:b0dcfe3aca1a8355955f4b415ede43530e3bb91953b6ffdd75c45891070fe0f1
{% endblock %}

{% block lib_deps %}
lib/reallocarray
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/c/naked
lib/shim/alloc
{% endblock %}

{% block patch %}
# disable mmap hooks
sed -e 's|defined(__linux)|0|' -i src/malloc_hook.cc
{% endblock %}

{% block cmake_flags %}
DEFAULT_BUILD_CPU_PROFILER=OFF
DEFAULT_BUILD_HEAP_PROFILER=OFF
DEFAULT_BUILD_HEAP_CHECKER=OFF
gperftools_build_minimal=ON
gperftools_build_benchmark=OFF
WITH_STACK_TRACE=OFF
GPERFTOOLS_BUILD_STATIC=OFF
DEFAULT_BUILD_MINIMAL=ON
DEFAULT_BUILD_DEBUGALLOC=OFF
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libtcmalloc_minimal.a
ar qL ${out}/lib/libtcmalloc_minimal.a $(find ${tmp}/obj -type f -name '*.a')
{% endblock %}

{% block env %}
export ac_cv_func_malloc_0_nonnull=yes
{% endblock %}
