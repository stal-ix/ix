{% extends '//mix/dl/lib.sh' %}

{% block lib_deps %}
lib/wayland
{% endblock %}

{% block export_libs %}
libwayland-cursor.a
{% endblock %}

{% block export_lib %}
wayland-cursor
{% endblock %}
