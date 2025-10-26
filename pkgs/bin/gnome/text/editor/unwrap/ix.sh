{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-text-editor
{% endblock %}

{% block version %}
49.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/{{self.version().strip()}}/gnome-text-editor-{{self.version().strip()}}.tar.bz2
e9509a1cc5a6a10b616af285ee4eb29e045ff0439ca8bb0ee884645e74cb4da3
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
