{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk/4.4/gtk-4.4.1.tar.xz
f3661ba9a9e6805172c776c9c0a3b73c
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/glib/mix.sh
lib/cairo/mix.sh
lib/pango/mix.sh
lib/epoxy/mix.sh
lib/wayland/mix.sh
lib/graphene/mix.sh
lib/freetype/mix.sh
lib/xkbcommon/mix.sh
lib/fontconfig/mix.sh
lib/gdk/pixbuf/mix.sh
{% endblock %}

{% block bld_tool %}
lib/glib/mix.sh
gnu/gettext/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

{% block meson_flags %}
-Dx11-backend=false
-Dmedia-ffmpeg=disabled
-Dmedia-gstreamer=disabled
-Dintrospection=disabled
{% endblock %}
