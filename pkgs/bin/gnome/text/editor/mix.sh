{% extends '//mix/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/42.0/gnome-text-editor-42.0.tar.bz2
sha:4c94073c30ee6ad054ac5883f6720fac63ac3344621498cf09728f7f83018d7e
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
bin/gettext
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
