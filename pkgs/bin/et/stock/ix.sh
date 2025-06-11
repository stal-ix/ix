{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
EternalTerminal
{% endblock %}

{% block version %}
6.2.9
{% endblock %}

{% block fetch %}
https://github.com/MisterTea/EternalTerminal/archive/refs/tags/et-v{{self.version().strip()}}.tar.gz
sha:13bfb2722b011b5f0a28fa619508deca96deec9eee5e42b922add0c166d8185a
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
