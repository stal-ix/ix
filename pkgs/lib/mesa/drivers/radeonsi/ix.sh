{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/llvm(vulkan=amd,opengl=radeonsi)
lib/mesa/drivers/opengl(driver=radeonsi)
lib/mesa/drivers/vulkan(driver=radeon)
{% endblock %}
