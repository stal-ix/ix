{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/bsd/impl
{% endif %}
{% endblock %}
