{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
WasmEdge
{% endblock %}

{% block version %}
0.17.1
{% endblock %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/{{self.version().strip()}}.tar.gz
b2da5bc43a6e11305ddffc7afa1d67c647fd49e34d334fc810ff63783fb52a25
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
