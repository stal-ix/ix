{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/mesa/drivers/llvm(vulkan=swrast,opengl=swrast)
{% endblock %}
