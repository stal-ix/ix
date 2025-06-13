{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
console
{% endblock %}

{% block version %}
48.0.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/{{self.version().strip()}}/console-{{self.version().strip()}}.tar.bz2
a10e3a6f90bbcbb2b304d8c60c027983e19d6753c15d4b040414aec931f6f678
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
