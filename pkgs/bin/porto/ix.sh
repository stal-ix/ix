{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/yandex/porto/archive/refs/tags/v5.3.9.tar.gz
sha:3c742d7ee08f1d97d6855517d9250f0a88b2b50d25192728004777896e97e187
{% endblock %}

{% block lib_deps %}
lib/c
lib/nl
lib/c++
lib/fts
lib/curses
lib/kernel
lib/protobuf
{% endblock %}

{% block bld_tool %}
bin/protoc
bld/fake(tool_name=pandoc)
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_missing %}
sys/time.h
unistd.h
{% endblock %}

{% block cmake_flags %}
ENABLE_GO=OFF
ENABLE_PYTHON=OFF
ENABLE_PORTODSHIM=OFF
{% endblock %}
