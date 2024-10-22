{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Cu3PO42/gtk-session-lock/archive/refs/tags/v0.2.0.tar.gz
sha:a4245c6930580c15ed263b9a7bb7e39f47693baec78be1026b4e0e28b233cb4e
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block meson_flags %}
vapi=false
introspection=false
{% endblock %}
