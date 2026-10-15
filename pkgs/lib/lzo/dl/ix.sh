{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/lzo
{% endblock %}

{% block export_libs %}
liblzo2.a
{% endblock %}

{% block export_lib %}
lzo2
{% endblock %}
