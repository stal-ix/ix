{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qtkeychain
{% endblock %}

{% block version %}
0.17.0
{% endblock %}

{% block fetch %}
https://github.com/frankosterfeld/qtkeychain/archive/refs/tags/{{self.version().strip()}}.tar.gz
3b85c3929034b0a99da777130c34d99f006fcd3a9d56564159399a33fee0e504
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
