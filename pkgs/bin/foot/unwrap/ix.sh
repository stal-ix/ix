{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.13.0.tar.gz
sha:9fd10584d40f6aac6b87c11a94e1fdfc4bac43aef9144f4aa84213257672da8c
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
