{% extends '//die/c/cmake.sh' %}

{% block version %}
1.3.296.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
sha:125cdf5f867532e26516e988ae
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/vulkan/headers
{% endblock %}
