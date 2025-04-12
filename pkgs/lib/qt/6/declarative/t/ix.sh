{% extends '//die/c/qt.sh' %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:3b91d1b75f22221f39b93647d73c9fe7fc4b9c8d45ff0cec402626eab15d8dd8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/shadertools
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/python
bld/qt/6/tools/shader
{% endblock %}
