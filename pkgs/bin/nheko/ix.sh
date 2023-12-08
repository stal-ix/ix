{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Nheko-Reborn/nheko
{% endblock %}

{% block git_commit %}
b4afeada58dbf2695a8dd4cac675a8d6c06ad251
{% endblock %}

{% block git_sha %}
qw
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block cmake_flags %}
MAN=OFF

