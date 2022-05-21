{% extends '//die/meson.sh' %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/pango
lib/epoxy
lib/wayland
lib/graphene
lib/freetype
lib/xkbcommon
lib/fontconfig
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib/codegen
bin/wayland/protocols
{% endblock %}

{% block run_data %}
aux/adwaita/icons
aux/hicolor-icon-theme
{% endblock %}
