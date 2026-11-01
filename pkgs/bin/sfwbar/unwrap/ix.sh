{% extends '//die/c/meson.sh' %}

{% block version %}
1.0_beta17
{% endblock %}

{% block pkg_name %}
sfwbar
{% endblock %}

{% block fetch %}
https://github.com/LBCrion/sfwbar/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a4915bc7dd0873c45d0d6b01b070e39a91fd16cfadf730d6a9e48db68a8cd09e
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/json/c
lib/kernel
lib/gtk/layer/shell/3
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
