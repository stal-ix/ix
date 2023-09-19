{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/45.0/gnome-text-editor-45.0.tar.bz2
sha:317b86d9cf17fa1338c91d501dfa90b8ef72c63a15758d0e171a3a255fb523f1
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
lib/gtk/source/view
lib/editor/config/core/c
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
