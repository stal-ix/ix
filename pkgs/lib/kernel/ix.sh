{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/linux/headers
{% endif %}
{% if freebsd %}
lib/freebsd/input
{% endif %}
{% endblock %}
