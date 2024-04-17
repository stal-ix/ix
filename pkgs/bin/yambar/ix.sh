{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/yambar/archive/1.11.0.tar.gz
sha:3649878ae7282203b4ff2aa9f45afad32a6fc8c921d94b6abdac2a1d21045aaf
{% endblock %}

{% block bld_libs %}
lib/c
lib/alsa
lib/yaml
lib/udev
lib/kernel
lib/tllist
lib/fcft/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/flex
bin/scdoc
bld/bison
bld/wayland
{% endblock %}

{% block meson_flags %}
backend-x11=disabled
backend-wayland=enabled
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
