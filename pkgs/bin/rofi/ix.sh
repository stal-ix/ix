{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/lbonn/rofi
{% endblock %}

{% block git_branch %}
1.7.5+wayland2
{% endblock %}

{% block git_sha %}
23d591ecb08804251e2d12984fe53032cbc8c7afff50df176351b835a2d14bdf
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
bld/glib
bld/wayland
{% endblock %}

{% block meson_flags %}
xcb=disabled
{% endblock %}
