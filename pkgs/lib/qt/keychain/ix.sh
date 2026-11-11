{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qtkeychain
{% endblock %}

{% block version %}
0.18.0
{% endblock %}

{% block fetch %}
https://github.com/frankosterfeld/qtkeychain/archive/refs/tags/{{self.version().strip()}}.tar.gz
837af59f2b950760a73eff81ccae817f7d3051183b447438dc610bb984a41691
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
