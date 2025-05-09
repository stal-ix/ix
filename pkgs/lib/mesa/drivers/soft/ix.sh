{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/vulkan(driver=lvp)
lib/mesa/drivers/opengl(driver=swrast)
lib/mesa/drivers/llvm(vulkan=swrast,opengl=swrast)
{% endblock %}
