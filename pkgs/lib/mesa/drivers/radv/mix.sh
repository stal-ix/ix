{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/egl
lib/mesa/drivers/t/valve(vulkan=amd,opengl=zink)
lib/mesa/drivers/t/opengl(driver=zink)
lib/mesa/drivers/t/vulkan(driver=radeon)
{% endblock %}
