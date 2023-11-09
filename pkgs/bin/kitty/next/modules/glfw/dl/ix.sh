{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
bin/kitty/next/modules/glfw
{% endblock %}

{% block export_libs %}
libglfw-wayland.a
{% endblock %}

{% block export_lib %}
glfw-wayland
{% endblock %}
