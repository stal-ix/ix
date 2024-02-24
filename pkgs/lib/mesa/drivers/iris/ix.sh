{% extends '//die/hub.sh' %}

{# classic Intel anv + iris #}

{% block lib_deps %}
lib/mesa/drivers/valve(vulkan=intel,opengl=iris)
lib/mesa/drivers/opengl(driver=iris)
lib/mesa/drivers/vulkan(driver=intel)
{% endblock %}
