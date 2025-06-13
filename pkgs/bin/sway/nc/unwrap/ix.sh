{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
SwayNotificationCenter
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block fetch %}
https://github.com/ErikReider/SwayNotificationCenter/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7f69fe248994404af4115d335929b3bd2faf8c6321374b5b3e3fa2c97d169c90
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
bld/glib
bin/vala
bin/sassc
bld/gnome
bin/scdoc
bld/wayland
{% endblock %}

{% block meson_flags %}
pulse-audio=false
{% endblock %}
