{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/lite-xl/lite-xl/archive/refs/tags/v2.1.3.tar.gz
sha:a13c423588a5549e42fda7dfe9064bd3776b6202c170c7bb493d96a692360383
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
