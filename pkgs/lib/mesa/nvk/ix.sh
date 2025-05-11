{% extends '//die/hub.sh' %}

{# NVIDIA nvk + zink opengl #}

{% block lib_deps %}
lib/vulkan/loader/dl
lib/mesa/vulkan(driver=nvk)
lib/mesa/opengl(driver=zink)
lib/mesa/valve(vulkan=nouveau,opengl=zink)
{% endblock %}
