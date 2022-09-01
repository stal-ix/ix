{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.13.1.tar.gz
sha:604f777fdaccfc1ee2d20376cc5688a819dcd6b7113725880cc973194fd6c737
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/fcft/3
lib/tllist
lib/pixman
lib/notify
lib/wayland
lib/freetype
lib/xkbcommon
lib/fontconfig
lib/{{allocator}}/trim(delay=3,bytes=1000000)
{% endblock %}

{% block bld_tool %}
bin/scdoc
lib/curses/n
bld/wayland
{% endblock %}
