{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
yaml-cpp
{% endblock %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://github.com/jbeder/yaml-cpp/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
YAML_CPP_BUILD_TOOLS=OFF
YAML_CPP_BUILD_TESTS=OFF
{% endblock %}
