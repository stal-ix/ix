{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/mesa/gl
lib/mesa/egl
lib/mesa/drivers/vulkan
lib/mesa/drivers/gl/zink
lib/glib/networking/register
{% endblock %}
