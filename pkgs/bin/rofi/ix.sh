{% extends '//die/c/meson.sh' %}

{# hard dep on X #}

{% block fetch %}
https://github.com/lbonn/rofi/releases/download/1.7.3%2Bwayland1/rofi-1.7.3+wayland1.tar.xz
sha:88c993d792549abc141f95c26ac99126fb91f6eed47bd4f3252e3decfe08dabd
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/cairo
lib/pango
lib/wayland
lib/xkbcommon
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/glib/codegen
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
xcb=disabled
{% endblock %}
