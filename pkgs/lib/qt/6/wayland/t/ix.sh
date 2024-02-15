{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.6.2.tar.gz
sha:2b9eb36f1ba68e8d450e5144079941b3b1d029122a0f31a96b8ef74b5d7082b9
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
