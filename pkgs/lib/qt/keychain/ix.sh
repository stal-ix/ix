{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/frankosterfeld/qtkeychain/archive/refs/tags/0.14.3.tar.gz
sha:a22c708f351431d8736a0ac5c562414f2b7bb919a6292cbca1ff7ac0849cb0a7
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
