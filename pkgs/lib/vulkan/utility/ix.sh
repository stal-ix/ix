{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Utility-Libraries
{% endblock %}

{% block version %}
1.4.363.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
a5308b62e3bac84cf45c4d7dd5b830aabace4847fdb71f4fd7db3be034c2bebf
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/vulkan/headers
{% endblock %}
