{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.7.0.tar.gz
sha:43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
YAML_CPP_BUILD_TOOLS=OFF
YAML_CPP_BUILD_TESTS=OFF
{% endblock %}
