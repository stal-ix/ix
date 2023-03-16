{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtdeclarative/archive/refs/tags/v6.4.3.tar.gz
sha:9549668f8ec28199ba19d73fb535855dc5bea690097f43c2f91954bc27ee0fa3
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
