{% extends '//die/hub.sh' %}

{# AMD radv + zink opengl + aco shaders #}

{% block lib_deps %}
lib/vulkan/loader/dl
lib/mesa/opengl(driver=zink)
lib/mesa/vulkan(driver=radeon)
lib/mesa/valve(vulkan=amd,opengl=zink)
{% endblock %}
