{% extends '//mix/template/dlstubs.sh' %}

{% block lib_deps %}
lib/c/mix.sh
lib/vulkan/loader/mix.sh
{% endblock %}

{% block export_lib %}
vulkan
{% endblock %}

{% block export_symbols %}
vkGetInstanceProcAddr
{% endblock %}
