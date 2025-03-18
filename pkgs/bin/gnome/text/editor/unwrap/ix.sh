{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/48.1/gnome-text-editor-48.1.tar.bz2
sha:a0a090123552fa8313f30660cab8378adeefecc1d137e3db2896fb9a1094096c
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
