{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/egl
lib/mesa/drivers/t/llvm(vulkan=swrast,opengl=swrast)
lib/mesa/drivers/t/opengl(driver=swrast)
lib/mesa/drivers/t/vulkan(driver=lvp)
{% endblock %}
