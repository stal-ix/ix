{% extends '//mix/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.11.0.tar.gz
sha:2b4f737eb4d266224e5dd0126168c6d770b0139d4b572078baf158d2f7166e4e
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/fcft/3
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
