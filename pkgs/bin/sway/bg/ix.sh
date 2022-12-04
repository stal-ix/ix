{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swaybg/archive/refs/tags/v1.2.0.tar.gz
sha:cfeab55b983da24352407279556c035b495890422578812d9a9c0bba1dc3ce75
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/wayland
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
