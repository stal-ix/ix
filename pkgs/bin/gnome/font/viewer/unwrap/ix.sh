{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/archive/44.0/gnome-font-viewer-44.0.tar.bz2
sha:91c1e51a5fbe1a78107f59b6d88589b3ed20b364c38b9f1a860f8bb08924a85c
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

{% block bld_tool %}
bld/gettext
{% endblock %}
