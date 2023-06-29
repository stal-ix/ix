{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/0.12.1.tar.gz
sha:68812775e5f5237300101f712eadf9d666b18859021edfa672e914db140ef957
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/boost
lib/spdlog
lib/llvm/15/full
{% endblock %}

{% block cmake_flags %}
SUPPORT_EXCLUDE_LIBS=OFF
WASMEDGE_BUILD_PLUGINS=OFF
WASMEDGE_LINK_LLVM_STATIC=ON
WASMEDGE_BUILD_AOT_RUNTIME=ON
{% endblock %}

{% block cpp_defines %}
O_SYMLINK=0
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}
