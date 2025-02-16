{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/glesv2/dl
lib/mesa/drivers/dl
lib/mesa/drivers/gbm
lib/mesa/drivers/{{mesa_driver}}/reg
{% endif %}
{% endblock %}
