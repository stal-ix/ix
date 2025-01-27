{% extends '//die/hub.sh' %}

{# Intel anv + zink opengl #}

{% block lib_deps %}
lib/mesa/drivers/intel(vulkan=intel,opengl=zink)
{% endblock %}
