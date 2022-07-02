{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/canberra
{% endblock %}

{% block export_libs %}
libcanberra.a
{% endblock %}

{% block export_lib %}
canberra
{% endblock %}
