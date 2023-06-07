{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v6.5.1.tar.gz
sha:b6f81ee73e8dbc30601c022b30ceb592fd2f8a5a79e7bc48fcd7feef80e3cc7a
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
