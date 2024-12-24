{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprcursor/archive/refs/tags/v0.1.11.tar.gz
sha:17e4576b884e6bdb463b445cffff099ad16647b826a87a67b78d38b8cad4c39e
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
