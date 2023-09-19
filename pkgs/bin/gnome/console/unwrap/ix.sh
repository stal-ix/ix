{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/console/-/archive/45.0/console-45.0.tar.bz2
sha:ab859a282d87a37efaa748b25c12cf510cc91277b1187b008cfb78f04f08e1c4
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
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' \
    -e 's|4.12.2|4.12.1|' \
    -i meson.build
{% endblock %}
