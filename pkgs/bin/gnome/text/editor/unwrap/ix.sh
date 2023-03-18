{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/44.0/gnome-text-editor-44.0.tar.bz2
sha:54e5e082af7f55da01da6d7a4e1c6f24e68abdd89768f1a4fe4af13a83a8f8f7
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
