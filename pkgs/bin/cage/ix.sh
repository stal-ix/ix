{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cage-kiosk
{% endblock %}

{% block version %}
0.2.0
{% endblock %}

{% block fetch %}
https://github.com/cage-kiosk/cage/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9d3f659e0f19636a958f9e1bf4d22268d7e2705d7e2989888401ec443c1cb6c3
{% endblock %}

{% block bld_libs %}
lib/c
lib/wlroots/18
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
