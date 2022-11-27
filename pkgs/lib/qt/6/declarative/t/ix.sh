{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v6.4.1.tar.gz
sha:23b5c91e98ec2b8a4118a3d3ace0c2e61b355cc8f2ccb87d189708b69446f917
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
