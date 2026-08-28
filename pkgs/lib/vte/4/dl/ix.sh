{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/vte/4
{% endblock %}

{% block export_libs %}
libvte-2.91-gtk4.a
{% endblock %}

{% block export_lib %}
vte-2.91-gtk4
{% endblock %}
