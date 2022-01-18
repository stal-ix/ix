{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.10.3.tar.gz
75e66a87d6e6e4e265d1219e459f53df
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
