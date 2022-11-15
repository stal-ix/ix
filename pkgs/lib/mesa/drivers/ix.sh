{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/mesa/drivers/{{mesa_driver}}
{% endif %}
{% endblock %}
