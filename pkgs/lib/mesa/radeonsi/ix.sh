{% extends '//die/hub.sh' %}

{# classic AMD radv + radeonsi + llvm shaders #}

{% block lib_deps %}
lib/mesa/vulkan(driver=radeon)
lib/mesa/opengl(driver=radeonsi)
lib/mesa/llvm(vulkan=amd,opengl=radeonsi)
{% endblock %}
