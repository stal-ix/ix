{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/wayland
{% endblock %}

{% block export_libs %}
libwayland-client.a
{% endblock %}

{% block export_lib %}
wayland-client
{% endblock %}
