{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/lbonn/rofi
{% endblock %}

{% block git_branch %}
1.7.5+wayland2
{% endblock %}

{% block git_sha %}
372c1c5016a224853c07eba9d592de269d2e191a94272ae1f55eb3d7d909c3fd
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/cairo
lib/pango
lib/wayland
lib/xkb/common
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/glib
bld/wayland
{% endblock %}

{% block meson_flags %}
xcb=disabled
{% endblock %}

{% block git_version %}
v3
{% endblock %}
