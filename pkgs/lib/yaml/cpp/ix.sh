{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
yaml-cpp
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block fetch %}
https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-{{self.version().strip()}}.tar.gz
25cb043240f828a8c51beb830569634bc7ac603978e0f69d6b63558dadefd49a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
YAML_CPP_BUILD_TOOLS=OFF
YAML_CPP_BUILD_TESTS=OFF
{% endblock %}
