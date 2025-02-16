{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if mesa_driver %}
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/drivers
lib/mesa/glesv2/dl
{% endif %}
{% endblock %}
