{% extends '//die/hub.sh' %}

{# classic AMD radv + radeonsi + llvm shaders #}

{% block lib_deps %}
lib/mesa/drivers/llvm(vulkan=amd,opengl=radeonsi)
{% endblock %}
