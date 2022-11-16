{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/linux/headers
{% endif %}
{% endblock %}
