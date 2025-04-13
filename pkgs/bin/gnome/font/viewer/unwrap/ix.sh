{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-font-viewer
{% endblock %}

{% block version %}
48.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/archive/{{self.version().strip()}}/gnome-font-viewer-{{self.version().strip()}}.tar.bz2
sha:7c713efe47d00d974b7da5b82173c24425745b661fa0947b7dbf24b913158da8
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/4
lib/adwaita
lib/gtk/deps
{% endblock %}

{% block patch %}
sed -e 's|gnome-desktop-4|fontconfig|' -i meson.build

find . -type f | while read l; do
    sed -e 's|.*include.*libgnome-desktop.*||' \
        -e 's|.*gtk_widget_class_install_action.*action_toggle_search_cb.*||' \
        -i ${l}
done
{% endblock %}
