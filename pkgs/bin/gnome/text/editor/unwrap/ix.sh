{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/45.2/gnome-text-editor-45.2.tar.bz2
sha:26891be27b51a90409e9a27352f0614ffb433668ed8c6239d61b963030155e80
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
