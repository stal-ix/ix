{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qtkeychain
{% endblock %}

{% block version %}
0.15.0
{% endblock %}

{% block fetch %}
https://github.com/frankosterfeld/qtkeychain/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:f4254dc8f0933b06d90672d683eab08ef770acd8336e44dfa030ce041dc2ca22
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
