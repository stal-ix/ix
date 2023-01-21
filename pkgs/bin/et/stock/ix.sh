{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/MisterTea/EternalTerminal/archive/refs/tags/et-v6.2.4.tar.gz
sha:95cfb79bc2f25d19eb84ca3c28dba860bb52b3750334d373adeb2cd061de6ba6
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
