{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-text-editor
{% endblock %}

{% block version %}
51.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/{{self.version().strip()}}/gnome-text-editor-{{self.version().strip()}}.tar.bz2
d54e2fd850d250b05a2ed642884200b381843d1de9e8151f60ae84e65aa095c3
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/intl
lib/glib
lib/pcre
lib/gtk/4
lib/pcre/2
lib/adwaita
lib/enchant
lib/gtk/deps
lib/spelling
lib/gtk/source/view/5
lib/editor/config/core/c
lib/gsettings/desktop/schemas
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
