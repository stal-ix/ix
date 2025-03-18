{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v0.1.12.tar.gz
sha:3200a7a31e28884b9d046f8ec7b0aa67ede9ce0ab0d20193c2b61ee522d6b1f2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/zip
lib/cairo
lib/hypr/lang
lib/toml/plus/plus
{% endblock %}

{% block bld_libs %}
lib/hypr/rsvg
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
