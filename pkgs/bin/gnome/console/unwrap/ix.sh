{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/48.0/console-48.0.tar.bz2
sha:c5c733817aff61871bccf2d676ed308f53db15ce354394c839b2992f78fbc4b1
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
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
