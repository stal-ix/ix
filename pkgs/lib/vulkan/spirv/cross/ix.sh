{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-1.3.275.0.tar.gz
sha:429ec74372a7a64ef144a42ab6a1aa23ac284d8069f1b6e6152dcb822ab7b3b1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
