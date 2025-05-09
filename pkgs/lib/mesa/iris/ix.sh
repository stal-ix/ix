{% extends '//die/hub.sh' %}

{# classic Intel anv + iris #}

{% block lib_deps %}
lib/mesa/opengl(driver=iris)
lib/mesa/vulkan(driver=intel)
lib/mesa/intel(vulkan=intel,opengl=iris)
{% endblock %}
