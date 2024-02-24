{% extends '//die/hub.sh' %}

{# AMD radv + zink opengl + aco shaders #}

{% block lib_deps %}
lib/vulkan/loader/dl
lib/mesa/drivers/valve(vulkan=amd,opengl=zink)
lib/mesa/drivers/opengl(driver=zink)
lib/mesa/drivers/vulkan(driver=radeon)
{% endblock %}
