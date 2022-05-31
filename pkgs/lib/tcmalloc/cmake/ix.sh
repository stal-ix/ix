{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-2.10.tar.gz
sha:b0dcfe3aca1a8355955f4b415ede43530e3bb91953b6ffdd75c45891070fe0f1
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block bld_libs %}
lib/mimalloc/2
# for LTO configure
lib/compiler_rt/hack/ish
{% endblock %}

{% block patch %}
cat << EOF >> src/malloc_extension.cc
static inline bool size_multiply_overflow(size_t size, size_t need) noexcept {
    return need != 0 && size > (SIZE_MAX / need);
}

extern "C" void* reallocarray(void* p, size_t need, size_t size) {
    if (size_multiply_overflow(size, need)) {
        errno = ENOMEM;

        return nullptr;
    }

    return realloc(p, size * need);
}
EOF
{% endblock %}

{% block cmake_flags %}
DEFAULT_BUILD_CPU_PROFILER=OFF
DEFAULT_BUILD_HEAP_PROFILER=OFF
DEFAULT_BUILD_HEAP_CHECKER=OFF
gperftools_build_minimal=ON
gperftools_build_benchmark=OFF
BUILD_TESTING=OFF
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
