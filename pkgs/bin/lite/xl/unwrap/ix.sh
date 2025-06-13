{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
lite-xl
{% endblock %}

{% block version %}
2.1.8
{% endblock %}

{% block fetch %}
https://github.com/lite-xl/lite-xl/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:fcaffb946bc60583369cb040d533a4ac18075a6d474d49a2a5ff4bf87e2e9a10
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/sdl/3
lib/pcre/2
lib/sdl/deps
lib/freetype
{% endblock %}

{% block meson_flags %}
renderer=true
use_system_lua=true
{% endblock %}
