{% extends '//die/c/qt.sh' %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:331a1e617952217868beeef7964828500388abeeb502ea3436f16eec816426c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
bld/qt/6/tools/shader
{% endblock %}
