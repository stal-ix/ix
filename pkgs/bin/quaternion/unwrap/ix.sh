{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/quotient-im/Quaternion
{% endblock %}

{% block git_branch %}
0.0.96-rc1
{% endblock %}

{% block git_sha %}
bc390adee2c2bb852896e2fa67a1af478dd53a3985b88f437b30e41300eb106e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
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
