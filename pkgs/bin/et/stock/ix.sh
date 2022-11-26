{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/MisterTea/EternalTerminal/archive/refs/tags/et-v6.2.1.tar.gz
sha:fdf68a51cb8b62b3dbbacd1d2aeba5d5491e5142e65c97713c2f1ce61d4fdbed
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
lib/shim/fake(lib_name=atomic)
lib/shim/fake(lib_name=stdc++fs)
{% endblock %}

{% block cmake_flags %}
DISABLE_VCPKG=ON
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}
