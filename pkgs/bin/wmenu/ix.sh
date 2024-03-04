{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~adnano/wmenu/archive/0.1.7.tar.gz
sha:f86c9bfb32a907d467c59d34123c8e7d55cda08524735b7c640b682830f854b9
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
