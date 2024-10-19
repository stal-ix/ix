{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/47.1/gnome-text-editor-47.1.tar.bz2
sha:c83c2f19f50671b0f0d229790abfa4b995004227a70d05f5d05baa141b0b0d39
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
