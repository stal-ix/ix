{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/quotient-im/Quaternion
{% endblock %}

{% block git_branch %}
0.0.96
{% endblock %}

{% block git_sha %}
244084db9a99df244a9be714d1456d3a641b159d10a67dfb50c4ed22672f8ed3
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
