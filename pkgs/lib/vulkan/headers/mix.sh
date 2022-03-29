{% extends '//mix/cmake.sh' %}

{% block fetch %}
#https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.3.210.tar.gz
#sha:e3a1bb9e089c62a8ad62b19f9617f382e974536d00dac39d190a2a1b95d1ea89

https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/sdk-1.3.204.1.tar.gz
sha:9c4d33f71467c915749fbf48c0c3a8ee7833f15babf398e3463cd88791fb592e

#https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.2.201.tar.gz
#sha:6b7f9c809acff4f0877e2e7722e02a08f2e17e06c6e2e8c84081631d15490009
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): check it'
{% endblock %}
