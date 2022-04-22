{% extends '//mix/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/42.1/gnome-text-editor-42.1.tar.bz2
sha:4b003f258c43c86c473b3b928f303c0b41ff60a6a28b229f9f6970d1e63717cb
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/glib
lib/gtk/4
lib/pcre/2
lib/adwaita
lib/gtk/deps
lib/gtk/source/view
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block meson_flags %}
enchant=disabled
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('gnome-text-editor')}}
{% endblock %}
