{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/ErikReider/SwayNotificationCenter/archive/refs/tags/v0.10.1.tar.gz
sha:5586d8a679dde5e530cb8b6f0c86abdd0d5e41362fc1c4e56e2211edea0f7a13
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
lib/gtk/layer/shell/gir
lib/gtk/{{gtk_ver}}/gir
lib/granite/{{gtk_ver}}/gir
{% endblock %}

{% block bld_tool %}
bld/glib
bin/vala
bin/sassc
bld/gnome
bin/scdoc
{% endblock %}

{% block meson_flags %}
pulse-audio=false
{% endblock %}
