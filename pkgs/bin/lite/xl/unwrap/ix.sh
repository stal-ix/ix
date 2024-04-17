{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/lite-xl/lite-xl/archive/refs/tags/v2.1.4.tar.gz
sha:611ab123a131bae990dc2103072a9c102171403b77e30169f557d3516f502cf6
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/sdl/2
lib/pcre/2
lib/sdl/deps
lib/freetype
{% endblock %}

{% block meson_flags %}
renderer=true
use_system_lua=true
{% endblock %}
