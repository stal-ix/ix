{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Utility-Libraries
{% endblock %}

{% block version %}
1.4.313.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
sha:3e04f32c6023997c153ad4b63e2fd344257e40a57ff5229ab7373e08a4fa2dd2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/vulkan/headers
{% endblock %}
