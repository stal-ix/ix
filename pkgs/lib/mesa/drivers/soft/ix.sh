{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/llvm(vulkan=swrast,opengl=swrast)
lib/mesa/drivers/opengl(driver=swrast)
lib/mesa/drivers/vulkan(driver=lvp)
{% endblock %}
