{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/frankosterfeld/qtkeychain/archive/refs/tags/0.14.1.tar.gz
sha:afb2d120722141aca85f8144c4ef017bd74977ed45b80e5d9e9614015dadd60c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/secret
lib/qt/6/base
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}
