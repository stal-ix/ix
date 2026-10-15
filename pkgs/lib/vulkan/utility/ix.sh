{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Utility-Libraries
{% endblock %}

{% block version %}
1.4.357.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
6d450436aea4a821d7b0d8bb914c2e375088d98eeeaad0fbf059fdb06ac937f4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/vulkan/headers
{% endblock %}
