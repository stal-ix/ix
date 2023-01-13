{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/python/3/{{python_ver or '11'}}
{% endblock %}
