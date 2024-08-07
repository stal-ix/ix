{% extends '//die/c/make.sh' %}

{% block fetch %}
https://codeberg.org/dwl/dwl/archive/v0.7.tar.gz
sha:401a572462fa89f6adf0d0cfe58d909ef334a2c7cd1357db86ec70f32bd4b4d3
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/wlroots/18
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/wayland
{% endblock %}
