{% extends '//die/hub.sh' %}

{# AMD radv + radeonsi + aco shaders #}

{% block lib_deps %}
lib/mesa/drivers/opengl(driver=radeonsi)
lib/mesa/drivers/vulkan(driver=radeon)
{% endblock %}
