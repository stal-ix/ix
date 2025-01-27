{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/opengl(driver=swrast)
lib/mesa/drivers/vulkan(driver=lvp)
{% endblock %}
