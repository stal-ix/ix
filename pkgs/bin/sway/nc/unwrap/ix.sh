{% extends '//die/c/meson.sh' %}

{# data/meson.build:40:4: ERROR: Program 'blueprint-compiler' not found or not executable #}

{% block pkg_name %}
SwayNotificationCenter
{% endblock %}

{% block version %}
0.12.6
{% endblock %}

{% block fetch %}
https://github.com/ErikReider/SwayNotificationCenter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0c844eb5c9524f924495bd4145e5db575096de36f3ec87fb37e4c1ed6eacb897
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk
lib/gee
lib/dbus
lib/glib
lib/handy
lib/notify
lib/granite
lib/json/glib
lib/gtk/layer/shell
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/glib/gir
lib/handy/gir
lib/pango/gir
lib/harfbuzz/gir
lib/gdk/pixbuf/gir
lib/gi/repository/gir
lib/gtk/{{gtk_ver}}/gir
lib/granite/{{gtk_ver}}/gir
lib/gtk/layer/shell/{{gtk_ver}}/gir
{% endblock %}

{% block bld_tool %}
bin/vala
bin/sassc
bld/gnome
bin/scdoc
bld/wayland
{% endblock %}

{% block meson_flags %}
pulse-audio=false
{% endblock %}
