{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-text-editor
{% endblock %}

{% block version %}
48.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/{{self.version().strip()}}/gnome-text-editor-{{self.version().strip()}}.tar.bz2
sha:ca76aefaaf4f85f3ab64cef11060c4f33a74fd8c06185497335befabd0c5784b
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
