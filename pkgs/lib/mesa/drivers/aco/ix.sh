{% extends '//die/hub.sh' %}

{# AMD radv + radeonsi + aco shaders #}

{% block lib_deps %}
lib/mesa/drivers/valve(vulkan=amd,opengl=radeonsi)
{% endblock %}
