{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtwayland/archive/refs/tags/v6.6.3.tar.gz
sha:291135923b6da1c71b7415206b35d4b6e7376d6bfdb1210eca231451893658ed
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
