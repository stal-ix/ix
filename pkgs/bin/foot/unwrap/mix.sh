{% extends '//mix/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.12.0.tar.gz
sha:d8c27f735d2f361ee627cce282bee2462545f4df9532ee6ac28fd86a193404fa
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
lib/{{allocator}}/trim(delay=1,bytes=1000000)
{% endblock %}

{% block bld_tool %}
bin/scdoc
lib/curses/n
bin/wayland/protocols
{% endblock %}
