{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v6.5.0.tar.gz
sha:38281cdfc60b8820ac2943eebabe968138f90629edc8c6c5e88a72a7ec05e303
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
