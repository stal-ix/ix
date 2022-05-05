{% extends '//mix/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/foot/archive/1.12.1.tar.gz
sha:14e307ac89454b682bb9f1bc644043779f4462df656034fcc4c1e72b18fbffdd
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
lib/{{allocator}}/trim(delay=1,bytes=1000000)
{% endblock %}

{% block bld_tool %}
bin/scdoc
lib/curses/n
bin/wayland/protocols
{% endblock %}
