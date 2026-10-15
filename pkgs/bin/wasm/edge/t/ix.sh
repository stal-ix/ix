{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
WasmEdge
{% endblock %}

{% block version %}
0.17.2
{% endblock %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/{{self.version().strip()}}.tar.gz
0c7617ac8bbfd4db768dc59f5b466375d442a57a14c3d86d3d04e391799cb255
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
