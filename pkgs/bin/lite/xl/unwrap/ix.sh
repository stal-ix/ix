{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
lite-xl
{% endblock %}

{% block version %}
2.1.7
{% endblock %}

{% block fetch %}
https://github.com/lite-xl/lite-xl/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:69d1ce4c1d148d382ccb06f45feca2565c5c8fe9d0b1b9bc1cbe014f6826ce6b
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
