{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/vte/3
{% endblock %}

{% block export_libs %}
libvte-2.91.a
{% endblock %}

{% block export_lib %}
vte-2.91
{% endblock %}
