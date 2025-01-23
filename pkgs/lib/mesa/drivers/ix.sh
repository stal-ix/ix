{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/mesa/egl
lib/mesa/drivers/dl
lib/mesa/drivers/{{mesa_driver}}/reg
{% endif %}
{% endblock %}
