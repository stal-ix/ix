{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/47.0/gnome-text-editor-47.0.tar.bz2
sha:934705dcd95ec13cff7174df17c3636864997be4be8bb374988c5ce83614061d
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

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
