{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/xdg-desktop-portal/archive/dc898cac4d7075b45fe9294acb959b07cd7ecf6a.tar.gz
sha:6ef03771e58625b0fa041d33afdfb5f3b6b88c0243e8f43507a829e4640401bb
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/fuse/3
lib/json/glib
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block patch %}
sed -e 's|flatpak_required =.*|flatpak_required = false|' \
    -e 's|bwrap_required =.*|bwrap_required = false|'     \
    -i meson.build
{% endblock %}

{% block strip_pc %}
{% endblock %}
