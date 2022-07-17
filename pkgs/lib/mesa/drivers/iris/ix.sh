{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/egl
lib/mesa/drivers/t/valve(vulkan=intel,opengl=iris)
lib/mesa/drivers/t/opengl(driver=iris)
lib/mesa/drivers/t/vulkan(driver=intel)
{% endblock %}
