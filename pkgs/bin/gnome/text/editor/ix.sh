{% extends '//die/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-text-editor/-/archive/42.2/gnome-text-editor-42.2.tar.bz2
sha:446b026597245b8cb3176c64117c95fec113bede59b6935585f7df570d4609e9
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
