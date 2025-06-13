{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Headers
{% endblock %}

{% block version %}
1.4.313.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
20743c99a96c07290f24377360e7a12bdd2c465ba202e0c7ef2ec25d446cf61d
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
