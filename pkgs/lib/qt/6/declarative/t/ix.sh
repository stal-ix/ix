{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtdeclarative
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0b71aa358703de8217177dbb620c86af9e9804482e607bb2cadbf116a65bd9c6
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
