{% extends '//mix/template/dlstubs.sh' %}

{% block lib_deps %}
lib/c/mix.sh
lib/mesa/drivers/full/mix.sh
{% endblock %}

{% block export_symbols %}
vk_icdGetInstanceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
vk_icdGetPhysicalDeviceProcAddr
{% endblock %}

{% block export_lib %}
vulkan_radeon
{% endblock %}
