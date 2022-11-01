{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/execinfo/{{execinfo_ver or 'fake'}}
{% endif %}
{% endblock %}
