{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
i3status
{% endblock %}

{% block version %}
2.15
{% endblock %}

{% block fetch %}
https://i3wm.org/i3status/i3status-{{self.version().strip()}}.tar.xz
sha:6c67f52cae4f139df764ad1cc736562be0f97750791bc212b53f34c06eaf2205
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
