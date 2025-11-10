{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
oneTBB
{% endblock %}

{% block version %}
2022.3.0
{% endblock %}

{% block fetch %}
https://github.com/oneapi-src/oneTBB/archive/refs/tags/v{{self.version().strip()}}.tar.gz
01598a46c1162c27253a0de0236f520fd8ee8166e9ebb84a4243574f88e6e50a
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
