{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/amd/vlk/driver/lib
{% endblock %}

{% block export_symbols %}
vk_icdGetInstanceProcAddr
vk_icdGetPhysicalDeviceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
vk_icdGetInstanceProcAddrSG
{% endblock %}

{% block export_prefix %}
amdvlk_
{% endblock %}

{% block export_lib %}
vulkan_swiftshader
{% endblock %}
