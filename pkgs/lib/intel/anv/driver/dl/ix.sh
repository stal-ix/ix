{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/dlfcn
lib/intel/anv/driver/lib
{% endblock %}

{% block export_symbols %}
vk_icdGetInstanceProcAddr
vk_icdGetPhysicalDeviceProcAddr
vk_icdNegotiateLoaderICDInterfaceVersion
{% endblock %}

{% block export_prefix %}
anv_
{% endblock %}

{% block export_lib %}
vulkan_swiftshader
{% endblock %}
