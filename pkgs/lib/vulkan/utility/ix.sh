{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Utility-Libraries
{% endblock %}

{% block version %}
1.4.321.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
0cb3c19bc1ce3877a69fe00955597684fa7bde569eea633ac735e36dd959768e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/vulkan/headers
{% endblock %}
