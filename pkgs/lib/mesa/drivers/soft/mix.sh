{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/mesa/egl
lib/mesa/drivers/t/llvm(vulkan=swrast,opengl=zink|swrast)
lib/mesa/drivers/t/opengl(driver=zink)
lib/mesa/drivers/t/vulkan(driver=lvp)
{% endblock %}
