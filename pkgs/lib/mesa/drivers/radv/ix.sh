{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/valve(vulkan=amd,opengl=zink)
lib/mesa/drivers/opengl(driver=zink)
lib/mesa/drivers/vulkan(driver=radeon)
{% endblock %}
