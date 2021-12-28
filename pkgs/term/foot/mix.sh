{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.10.2.tar.gz
b875ed196bc624c78e7b35967675a813
{% endblock %}

{% block bld_libs %}
lib/c
lib/fcft
lib/linux
lib/tllist
lib/pixman
lib/wayland
lib/freetype
lib/xkbcommon
lib/fontconfig
{% endblock %}

{% block bld_tool %}
lib/curses/n
dev/doc/scdoc
lib/wayland/protocols
{% endblock %}
