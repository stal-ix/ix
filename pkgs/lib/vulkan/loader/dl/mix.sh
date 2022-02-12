{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/c
lib/vulkan/loader
{% endblock %}

{% block export_lib %}
vulkan
{% endblock %}

{% block export_symbols %}
vkGetInstanceProcAddr
{% endblock %}
