{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/vulkan/loader/dl
lib/mesa/drivers/valve(vulkan=intel,opengl=zink)
lib/mesa/drivers/opengl(driver=zink)
lib/mesa/drivers/vulkan(driver=intel)
{% endblock %}
