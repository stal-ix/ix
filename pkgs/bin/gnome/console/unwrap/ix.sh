{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
console
{% endblock %}

{% block version %}
51.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/{{self.version().strip()}}/console-{{self.version().strip()}}.tar.bz2
bcf3342db71e0629a19734819aa76245411849b7ab011009dc183658edfac03d
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
bin/appstream/cli
bin/xdg/file/utils
{% endblock %}

{% block meson_tool %}
bld/meson/6
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
