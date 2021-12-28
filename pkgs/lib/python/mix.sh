{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/python/{{(python or '3.10').replace('.', '/')}}
{% endblock %}
