{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Headers
{% endblock %}

{% block version %}
1.4.357.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Headers/archive/e3b1eec08173d6b825cd3ac88c885a63b621504a.tar.gz
f492279345cbc10708b64fcd432b3ff6c8246a5837c4db2b649abba00cf82208
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
