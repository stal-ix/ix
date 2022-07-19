{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/egl
lib/mesa/drivers/{{mesa_driver or 'soft'}}
{% endblock %}
