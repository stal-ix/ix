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
lib/handy/gir
lib/gtk/layer/shell
{% endblock %}

{% block host_libs %}
lib/handy/gir
{% endblock %}

{% block bld_tool %}
bld/glib
bin/vala
bin/sassc
bld/gnome
bin/scdoc
lib/handy/gir
{% endblock %}

{% block meson_flags %}
pulse-audio=false
{% endblock %}

{% block build %}
which vala
echo ${VALAFLAGS}
{{super()}}
{% endblock %}
