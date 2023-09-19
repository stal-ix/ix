{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/archive/45.0/gnome-font-viewer-45.0.tar.bz2
sha:124abfb43675c5f302e0233918b5e7325c8d2405571f28eac461c8a3aca5bbf9
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
