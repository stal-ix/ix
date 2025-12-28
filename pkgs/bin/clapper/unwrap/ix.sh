{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
clapper
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block fetch %}
https://github.com/Rafostar/clapper/archive/refs/tags/{{self.version().strip()}}.tar.gz
344c0f20e540a63c6fb44cdd5de88c168ed145bb66c1307e79b2b08124780118
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
bld/gnome
{% endblock %}

{% block meson_flags %}
clapper-app=enabled
enhancers-loader=disabled
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}
