{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/cap/{{cap_ver or '2'}}
{% endblock %}
