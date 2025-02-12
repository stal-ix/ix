{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/swift/shader/driver/lib
{% endblock %}

{% block export_symbols %}
vk_icdGetInstanceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
vk_icdGetPhysicalDeviceProcAddr
{% endblock %}

{% block export_prefix %}
sw_
{% endblock %}

{% block export_lib %}
vulkan_swiftshader
{% endblock %}
