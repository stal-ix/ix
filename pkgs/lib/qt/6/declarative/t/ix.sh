{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v6.4.2.tar.gz
sha:dec3599b55f75cff044cc6384fa2f7e9505f8a48af1b4c185c2789e2dafabda6
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
