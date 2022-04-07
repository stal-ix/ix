{% extends '//mix/dl/fix.sh' %}

{% block lib_deps %}
lib/vulkan/loader
{% endblock %}

{% block export_lib %}
vulkan
{% endblock %}

{% block export_symbols %}
vkGetInstanceProcAddr
{% endblock %}
