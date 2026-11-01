{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Headers
{% endblock %}

{% block version %}
1.4.363.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
4a078be12bef21cfebc09d878b77a63cff9d68f899254a0b00d0e37ef73e7f7e
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
