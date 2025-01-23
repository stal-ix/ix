{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/opengl(driver=radeonsi)
lib/mesa/drivers/vulkan(driver=radeon)
{% endblock %}
