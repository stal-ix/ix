{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Nheko-Reborn/nheko
{% endblock %}

{% block git_commit %}
b4afeada58dbf2695a8dd4cac675a8d6c06ad251
{% endblock %}

{% block git_sha %}
8560ca8ea8f491b34da558de3cd9772d6782bf1fa30f1a69a0b7aa05ad6138a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/olm
lib/lmdb
lib/coeurl
lib/lmdb/xx
lib/mtxclient
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/multimedia
{% endblock %}

{% block cmake_flags %}
MAN=OFF
X11=OFF
VOIP=OFF
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}
