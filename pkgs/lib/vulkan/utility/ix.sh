{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/archive/refs/tags/vulkan-sdk-1.3.275.0.tar.gz
sha:37d6b0771e1e351916f4d642cc12c696a3afffea6c47f91c97372287974e2bd8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/vulkan/headers
{% endblock %}
