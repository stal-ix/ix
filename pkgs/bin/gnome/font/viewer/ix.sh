{% extends '//die/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/archive/42.0/gnome-font-viewer-42.0.tar.bz2
sha:82fe7dcb6ffdf090a70f025653043504a95f09651d40a427a3c802b3383352dc
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/4
lib/adwaita
lib/gtk/deps
{% endblock %}

{% block patch %}
sed -e 's|gnome-desktop-4|fontconfig|' -i meson.build

find . -type f | while read l; do
    sed -e 's|.*include.*libgnome-desktop.*||' -i ${l}
done
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('gnome-font-viewer')}}
{% endblock %}
