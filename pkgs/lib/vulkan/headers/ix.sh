{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Headers
{% endblock %}

{% block version %}
1.3.296.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
sha:1e872a0be3890784bbe68dcd89b7e017fed77ba95820841848718c98bda6dc33
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
