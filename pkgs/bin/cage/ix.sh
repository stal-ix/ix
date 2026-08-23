{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cage-kiosk
{% endblock %}

{% block version %}
0.3.1
{% endblock %}

{% block fetch %}
https://github.com/cage-kiosk/cage/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6dc1619665acd367e0174c93b234002549a66f55f1de9197d67f0305415babc8
{% endblock %}

{% block bld_libs %}
lib/c
lib/wlroots/19
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
