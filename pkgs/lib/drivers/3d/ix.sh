{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/drivers/vulkan
lib/drivers/opengl
{% if mesa_driver %}
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/glesv2/dl
{% endif %}
{% endblock %}
