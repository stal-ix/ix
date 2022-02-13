{% extends '//mix/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.10.3.tar.gz
75e66a87d6e6e4e265d1219e459f53df
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/fcft/2
lib/tllist
lib/pixman
lib/wayland
lib/freetype
lib/xkbcommon
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
lib/curses/n
bin/wayland/protocols
{% endblock %}
