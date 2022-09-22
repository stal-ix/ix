{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.211.0.tar.gz
#sha:c464bcdc24b7541ac4378a270617a23d4d92699679a73f95dc4b9e1da924810a
https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.224.0.tar.gz
sha:ccdfa47cea58a080957481fb6c35908d005d04cc5dd1778150dc0c651ccea077
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
{% endblock %}
