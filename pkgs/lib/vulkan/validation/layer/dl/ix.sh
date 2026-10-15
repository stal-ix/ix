{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/vulkan/validation/layer/lib
{% endblock %}

{% block export_symbols %}
vkGetInstanceProcAddr
vkGetDeviceProcAddr
vkEnumerateInstanceLayerProperties
vkEnumerateInstanceExtensionProperties
vkNegotiateLoaderLayerInterfaceVersion
{% endblock %}

{% block export_prefix %}
vvl_
{% endblock %}

{% block export_lib %}
VkLayer_khronos_validation
{% endblock %}
