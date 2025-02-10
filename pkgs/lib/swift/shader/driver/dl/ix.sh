{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
vk_icdGetInstanceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
vk_icdGetPhysicalDeviceProcAddr
{% endblock %}

{% block export_prefix %}
sw_
{% endblock %}

{% block export_lib %}
vulkan_lvp
{% endblock %}
