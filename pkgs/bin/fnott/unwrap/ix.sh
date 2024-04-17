{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/fnott/archive/1.5.0.tar.gz
sha:0d55adb362d632225e8a1f574ce57f477fba1abac62a3937ddb651de69e4652b
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/dbus
lib/kernel
lib/tllist
lib/fcft/3
lib/pixman
lib/wayland
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
