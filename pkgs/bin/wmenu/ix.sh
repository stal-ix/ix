{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~adnano/wmenu/archive/0.1.8.tar.gz
sha:0079d3bbe82e0b02035450b4b31609dd5b822116ea4c14979d2e26d91db3c461
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/pango
lib/wayland
lib/xkb/common
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
