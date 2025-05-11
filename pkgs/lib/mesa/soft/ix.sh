{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/vulkan(driver=lvp)
lib/mesa/opengl(driver=swrast)
lib/mesa/llvm(vulkan=swrast,opengl=swrast)
{% endblock %}
