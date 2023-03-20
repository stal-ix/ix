{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/yandex/porto/archive/refs/tags/v5.3.15.tar.gz
sha:b28e0e73d315f920a4aec248accc618782ce728441e6bc028954f76ffd26327a
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

{% block patch %}
base64 -d << EOF > CMakeLists.txt
{% include 'CMakeLists.txt/base64' %}
EOF
{% endblock %}

{% block cmake_flags %}
ENABLE_GO=OFF
ENABLE_PYTHON=OFF
ENABLE_PORTODSHIM=OFF
{% endblock %}
