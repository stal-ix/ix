{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
console
{% endblock %}

{% block version %}
50.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/{{self.version().strip()}}/console-{{self.version().strip()}}.tar.bz2
afbf56d62e21be1b6c5f8ee18678aa94df25e7f404e12b926ecc07d9c1c0d1c1
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
