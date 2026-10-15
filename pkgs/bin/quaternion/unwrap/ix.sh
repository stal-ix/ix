{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Quaternion
{% endblock %}

{% block version %}
0.0.97.1
{% endblock %}

{% block git_repo %}
https://github.com/quotient-im/Quaternion
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
18b60a64504d426c180db47490ba143f337254489aef8ea24207796c2ab0297c
{% endblock %}

{% block git_version %}
v4
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/olm
lib/qt/6/base
lib/qt/6/deps
lib/qt/keychain
lib/qt/6/multimedia
lib/qt/6/declarative
lib/qt/6/declarative/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}
