{% extends '//die/hub.sh' %}

{# classic Intel anv + iris #}

{% block lib_deps %}
lib/mesa/drivers/opengl(driver=iris)
lib/mesa/drivers/vulkan(driver=intel)
lib/mesa/drivers/intel(vulkan=intel,opengl=iris)
{% endblock %}
