{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
EternalTerminal
{% endblock %}

{% block version %}
7.1.1
{% endblock %}

{% block fetch %}
https://github.com/MisterTea/EternalTerminal/archive/refs/tags/et-v{{self.version().strip()}}.tar.gz
7f5ab26f5cc18e66184d806648a2437c447b549ca106a7e6107f793435e39270
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curl
lib/boost
lib/kernel
lib/sodium
lib/curses
lib/unwind
lib/openssl
lib/protobuf
lib/shim/fake(lib_name=gcc_s)
lib/shim/fake(lib_name=stdc++fs)
{% endblock %}

{% block cmake_flags %}
DISABLE_VCPKG=ON
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="${CXXFLAGS} -std=c++17"
{% endblock %}

{% block patch %}
sed -e '/list(APPEND _Unwind_LINK_LIBRARIES lzma)/d' \
    -i cmake/FindUnwind.cmake
{% endblock %}
