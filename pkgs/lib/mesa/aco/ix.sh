{% extends '//die/hub.sh' %}

{# AMD radv + radeonsi + aco shaders #}

{% block lib_deps %}
lib/mesa/vulkan(driver=radeon)
lib/mesa/opengl(driver=radeonsi)
lib/mesa/valve(vulkan=amd,opengl=radeonsi)
{% endblock %}
