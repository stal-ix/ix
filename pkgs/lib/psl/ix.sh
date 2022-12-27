{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/rockdaboot/libpsl/releases/download/0.21.2/libpsl-0.21.2.tar.gz
sha:e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f
{% endblock %}

{% block lib_deps %}
lib/c
lib/idn/2
{% endblock %}
