{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/quotient-im/Quaternion
{% endblock %}

{% block git_branch %}
0.0.96
{% endblock %}

{% block git_sha %}
0b78df78a6c1e967b2d973d5089e1aab24d3a91be4d0d11c8f971246af370a81
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
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}
