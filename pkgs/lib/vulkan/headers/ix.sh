{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/vulkan-sdk-1.3.268.0.tar.gz
sha:94993cbe2b1a604c0d5d9ea37a767e1aba4d771d2bfd4ddceefd66243095164f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): check it'
{% endblock %}

{% block env %}
export VK_XML="${out}/share/vulkan/registry/vk.xml"
export VulkanHeaders_DIR=${out}/share/cmake/VulkanHeaders
{% endblock %}
