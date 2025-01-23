{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/shim
lib/mesa/drivers/{{mesa_driver or 'none'}}
{% endblock %}
