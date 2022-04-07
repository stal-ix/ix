{% extends '//mix/dl/lib.sh' %}

{% block lib_deps %}
lib/wayland
{% endblock %}

{% block export_libs %}
libwayland-egl.a
{% endblock %}

{% block export_lib %}
wayland-egl
{% endblock %}
