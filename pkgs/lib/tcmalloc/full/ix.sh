{% extends '//lib/tcmalloc/cmake/ix.sh' %}

{% block bld_libs %}
lib/linux
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|static_cast<uintptr_t>|(uintptr_t)|' -i src/heap-checker.cc
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
gperftools_enable_frame_pointers=ON
#DEFAULT_BUILD_CPU_PROFILER=OFF
#DEFAULT_BUILD_HEAP_PROFILER=OFF
#DEFAULT_BUILD_HEAP_CHECKER=OFF
#gperftools_build_minimal=ON
#gperftools_build_benchmark=OFF
#BUILD_TESTING=OFF
#WITH_STACK_TRACE=OFF
#GPERFTOOLS_BUILD_STATIC=OFF
#DEFAULT_BUILD_MINIMAL=ON
#DEFAULT_BUILD_DEBUGALLOC=OFF
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*HAVE_LIBUN.*||' -i ${tmp}/obj/config.h
{% endblock %}
