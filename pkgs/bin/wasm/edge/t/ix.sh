{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
WasmEdge
{% endblock %}

{% block version %}
0.14.1
{% endblock %}

{% block fetch %}
https://github.com/WasmEdge/WasmEdge/archive/refs/tags/{{self.version().strip()}}.tar.gz
ff95d3b9d4736f36e31c0477208cc70f12a0a3f946bbf756f1e7b181877d5af3
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
