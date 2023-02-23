{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.236.0.tar.gz
#sha:2df85b3daa78ced7f910db870ea2aed10f718c703e18076b4549ca4005c9c451
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.239.0.tar.gz
sha:865fa8e8e8314fcca60777a92f50bd0cf612205a36e719d6975482d3366f619e
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
