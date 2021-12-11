{% extends '//mix/template/dlstubs.sh' %}

{% block lib_deps %}
lib/vulkan/loader/mix.sh
{% endblock %}

{% block export_lib %}
vulkan
{% endblock %}

{% block export_symbols %}
vkGetInstanceProcAddr
{% endblock %}
