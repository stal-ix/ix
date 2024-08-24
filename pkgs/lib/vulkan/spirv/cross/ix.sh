{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/vulkan-sdk-1.3.290.0.tar.gz
sha:1333fd2a05ab8a0572106e3b7fb8161ea0b67ab7d0a1b8bdd14b47f89ac8a611
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
