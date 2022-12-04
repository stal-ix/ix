{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swayidle/archive/refs/tags/1.8.0.tar.gz
sha:0fba74c520a2bd64acd00bc3bce7bc8c7b84a2609c0f66329d72dfb33cca03d7
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
