{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
WasmEdge
{% endblock %}

{% block version %}
0.15.0
{% endblock %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/{{self.version().strip()}}.tar.gz
6bb5d07a39df6afb4acf2f1859b15a2ed36f376ea973217047004d7ebdfead2e
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
{% endblock %}
