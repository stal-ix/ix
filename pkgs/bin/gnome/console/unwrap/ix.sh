{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/44.4/console-44.4.tar.bz2
sha:97ed969727e5479f1c118a25f7ff453e036089c5d2281420ee315e9aead216e0
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtop
lib/vte/4
lib/gtk/4
lib/adwaita
lib/gtk/deps
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bin/sassc
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
