{% extends '//die/c/cmake.sh' %}

{% block version %}
2021.13.0
{% endblock %}

{% block fetch %}
https://github.com/oneapi-src/oneTBB/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3ad5dd08954b39d113dc5b3f8a8dc6dc1fd5250032b7c491eb07aed5c94133e1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ucontext
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block setup_tools %}
ln -s $(which llvm-install-name-tool) install_name_tool
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
