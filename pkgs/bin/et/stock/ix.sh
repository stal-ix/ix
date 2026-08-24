{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
EternalTerminal
{% endblock %}

{% block version %}
7.0.0
{% endblock %}

{% block fetch %}
https://github.com/MisterTea/EternalTerminal/archive/refs/tags/et-v{{self.version().strip()}}.tar.gz
3580962861589c0b69efd6b385ff92ad8fdf688c91d1a0edc1a83278205e28e8
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
