{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/lz4
{% endblock %}

{% block export_libs %}
liblz4.a
{% endblock %}

{% block export_lib %}
lz4
{% endblock %}
