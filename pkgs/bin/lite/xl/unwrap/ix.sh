{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/lite-xl/lite-xl/archive/refs/tags/v2.1.5.tar.gz
sha:b1a4dc1ad8ed8e0c822a4381131a21db4f81edae84259da556a4435d0be12de9
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
