{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
WasmEdge
{% endblock %}

{% block version %}
0.18.1
{% endblock %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/{{self.version().strip()}}.tar.gz
2a04eae7111185289e611474e7fbd051b3c3734cc1ad21149c0a6ab93e3419ae
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/zstd
lib/boost
lib/spdlog
{% endblock %}

{% block cmake_flags %}
WASMEDGE_FORCE_DISABLE_LTO=ON
SUPPORT_EXCLUDE_LIBS=OFF
WASMEDGE_BUILD_PLUGINS=OFF
WASMEDGE_LINK_LLVM_STATIC=ON
{% endblock %}

{% block cpp_defines %}
O_SYMLINK=0
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}
