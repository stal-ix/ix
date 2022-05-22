{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/egl
lib/mesa/drivers/t/llvm(vulkan=amd,opengl=radeonsi)
lib/mesa/drivers/t/opengl(driver=radeonsi)
lib/mesa/drivers/t/vulkan(driver=radeon)
{% endblock %}
