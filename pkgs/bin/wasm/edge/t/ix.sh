{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/0.13.3.tar.gz
sha:ad7a09f1a0f245473af748244f656387841e9f496b894a66feee954066bb6454
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/boost
lib/spdlog
{% endblock %}

{% block cmake_flags %}
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
