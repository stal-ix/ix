{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk/4.4/gtk-4.4.1.tar.xz
f3661ba9a9e6805172c776c9c0a3b73c
{% endblock %}

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
lib/glib
gnu/gettext
lib/wayland/protocols
{% endblock %}

{% block meson_flags %}
-Dx11-backend=false
-Dmedia-ffmpeg=disabled
-Dmedia-gstreamer=disabled
-Dintrospection=disabled
{% endblock %}
