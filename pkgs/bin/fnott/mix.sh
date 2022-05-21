{% extends '//die/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/1.2.1.tar.gz
sha:a4e72845cde23aff0653f9b218a32cb40ae628b3f690dc02333ea95469faf216
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/dbus
lib/linux
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/wayland/protocols
{% endblock %}
