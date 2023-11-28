{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.6.1.tar.gz
sha:1a7d4b5ecca2670466e862fc4e57a5be1ae921529e111637a0727b90938fa0c2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/xkb/common
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
