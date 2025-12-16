{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
clapper
{% endblock %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://github.com/Rafostar/clapper/archive/refs/tags/{{self.version().strip()}}.tar.gz
f0d6faea1285ff4b3a1c3c758181cd1b501cd066f87afd0d6fde5fc7e83eba60
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/soup/3
lib/adwaita
lib/gtk/deps
lib/micro/dns
lib/gstreamer
lib/gstreamer/dl
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
bld/gettext
bld/wrap/cc/plugins/gnome
bld/fake(tool_name=update-mime-database)
{% endblock %}

{% block meson_flags %}
clapper-app=enabled
enhancers-loader=disabled
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
