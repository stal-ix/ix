{% extends '//die/hub.sh' %}

{# Intel anv + zink opengl #}

{% block lib_deps %}
lib/vulkan/loader/dl
lib/mesa/opengl(driver=zink)
lib/mesa/vulkan(driver=intel)
lib/mesa/intel(vulkan=intel,opengl=zink)
{% endblock %}
