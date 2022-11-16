{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://i3wm.org/i3status/i3status-2.14.tar.xz
sha:5c4d0273410f9fa3301fd32065deda32e9617fcae8b3cb34793061bf21644924
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/yajl
lib/alsa
lib/kernel
lib/confuse
{% endblock %}

{% block meson_flags %}
pulseaudio=false
{% endblock %}

{% block bld_tool %}
bld/bash
bld/perl
{% endblock %}
