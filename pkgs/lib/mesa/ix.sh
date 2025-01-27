{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/{{mesa_driver or 'valve'}}
{% endblock %}
