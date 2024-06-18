{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.7.2.tar.gz
sha:e4cb055bca9a76266821bc2320ff9feaae96eaca0a6a453e99722410b2a5fff2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
lib/qt/6/base
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
