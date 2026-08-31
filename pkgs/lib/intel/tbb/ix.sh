{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
oneTBB
{% endblock %}

{% block version %}
2023.1.0
{% endblock %}

{% block fetch %}
https://github.com/oneapi-src/oneTBB/archive/refs/tags/v{{self.version().strip()}}.tar.gz
191288b52e1e6b17198000b64d77d194bb65e791be46ebc606e9b091781e2070
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ucontext
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
sed -e 's|.*#pragma weak.*||' -i src/tbb/itt_notify.cpp
{% endblock %}

{% block cmake_flags %}
TBB_TEST=OFF
TBB_STRICT=OFF
TBBMALLOC_BUILD=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Threads::Threads|c|' -i ${out}/lib/cmake/TBB/TBBTargets.cmake
{% endblock %}
