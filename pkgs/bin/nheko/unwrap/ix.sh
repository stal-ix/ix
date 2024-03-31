{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Nheko-Reborn/nheko
{% endblock %}

{% block git_commit %}
b4afeada58dbf2695a8dd4cac675a8d6c06ad251
{% endblock %}

{% block git_sha %}
674030fd7844e6bd027ba7f242aaade03b2e0a275257c1097720ae3c8fba78f5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/olm
lib/lmdb
lib/cmark
lib/coeurl
lib/lmdb/xx
lib/qt/6/svg
lib/mtxclient
lib/qt/6/base
lib/qt/6/deps
lib/qt/keychain
lib/qt/6/multimedia
lib/qt/6/declarative
lib/qt/6/declarative/deps
lib/kd/single/application
{% endblock %}

{% block cpp_defines %}
QT_STATICPLUGIN=1
{% endblock %}

{% block cmake_flags %}
MAN=OFF
X11=OFF
VOIP=OFF
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}

{% block git_version %}
v3
{% endblock %}
