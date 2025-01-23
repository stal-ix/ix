{% extends '//die/hub.sh' %}

{# AMD radv + zink opengl + aco shaders #}

{% block lib_deps %}
lib/mesa/drivers/valve(vulkan=amd,opengl=zink)
{% endblock %}
