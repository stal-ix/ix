{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cage-kiosk
{% endblock %}

{% block version %}
0.2.1
{% endblock %}

{% block fetch %}
https://github.com/cage-kiosk/cage/archive/refs/tags/v{{self.version().strip()}}.tar.gz
acab0c83175164a788d7b9f89338cbdebdc4f7197aff6fdc267c32f7181234a9
{% endblock %}

{% block bld_libs %}
lib/c
lib/wlroots/19
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
