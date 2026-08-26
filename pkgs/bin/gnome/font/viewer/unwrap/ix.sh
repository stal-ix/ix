{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gnome-font-viewer
{% endblock %}

{% block version %}
50.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/archive/{{self.version().strip()}}/gnome-font-viewer-{{self.version().strip()}}.tar.bz2
e8f501da15ff73b3557ac2b0edd91d53ac0ddf4ca96358c91ddfb94fcd47d54d
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
