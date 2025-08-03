{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
EternalTerminal
{% endblock %}

{% block version %}
6.2.11
{% endblock %}

{% block fetch %}
https://github.com/MisterTea/EternalTerminal/archive/refs/tags/et-v{{self.version().strip()}}.tar.gz
e8e80800babc026be610d50d402a8ecbdfbd39e130d1cfeb51fb102c1ad63b0f
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
