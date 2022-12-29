{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/lite-xl/lite-xl/archive/refs/tags/v2.1.1.tar.gz
sha:75c0cbda2d34a88e86d3aa48abe9f0366093df3019796c03067a7594cc55abe6
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/2
lib/pcre/2
lib/sdl/deps
lib/freetype
lib/lua/puc/5/4
{% endblock %}

{% block meson_flags %}
renderer=true
{% endblock %}
