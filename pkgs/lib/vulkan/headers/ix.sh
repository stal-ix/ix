{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.239.0.tar.gz
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.250.0.tar.gz
sha:0da601a81b868bc543ec09ab7e514d1b059774993dfce81df7150f432c8bf33a
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
